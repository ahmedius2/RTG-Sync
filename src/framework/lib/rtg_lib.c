/*
 * lib/rtg_lib.c
 *
 * Shared library which provides various virtual gang related utilities
 * including registering a virtual gang member with the kernel, synchronization
 * between virtual gang members etc.
 *
 * Copyright (C) 2019 CSL-KU
 *
 * 2019-05-15	Create shared library for RT-Gang runtime calls
 * 2019-05-20	Use virtual gang ID value for managing runtime resources
 * 2019-05-21	Add kernel interface management during virtual gang setup
 */
#include "rtg_lib.h"

/*
 * open_shared_file: Helper function for opening a given file with the provided
 * access permissions.
 *
 * @shared_file		Full (path) name of the file
 * @flags		Access permissions
 * @return		Integer denoting the descriptor of the opened file
 */
static int open_shared_file (char* shared_file, int flags)
{
	int fd;

	fd = open (shared_file, flags);
	rtg_assert (fd >= 0, "Failed to open shared file");

	return fd;
}

/*
 * seek_and_set_file: Helper function for adjusting the seek in the provided
 * file to a certain offset.
 *
 * @fd			File descriptor of the shared file
 * @offset		Seek offset
 */
static void seek_and_set_file (int fd, size_t offset)
{
	int ret;

	ret = lseek (fd, offset - 1, SEEK_SET);
	rtg_assert (ret >= 0, "Failed to set seek in the file");

	ret = write (fd, "", 1);
	rtg_assert (ret >= 0, "Failed to write to the file");

	return;
}

/*
 * map_pthread_barrier: Helper function to map pthread barrier in the given
 * shared file into the calling process' address space.
 *
 * @fd			File descriptor of the shared file
 * @return		Pthread barrier object in shared memory
 */
static pthread_barrier_t* map_pthread_barrier (int fd)
{
	pthread_barrier_t *shmem_barrier;
	
	shmem_barrier = (pthread_barrier_t *) mmap (NULL,
						    sizeof (pthread_barrier_t),
						    PROT_READ | PROT_WRITE,
						    MAP_SHARED, fd, 0);

	rtg_assert (shmem_barrier != MAP_FAILED, "Failed to mmap pthread barrier");

	return shmem_barrier;
}

/*
 * set_pthread_attr_shared: Helper function for marking a pthread barrier as
 * shared between processes.
 *
 * @attr		Pthread barrier attribute structure
 */
static void set_pthread_attr_shared (pthread_barrierattr_t* attr)
{
	int ret;

	ret = pthread_barrierattr_setpshared (attr, PTHREAD_PROCESS_SHARED);
	rtg_assert (!ret, "Failed to set pthread attribute to shared");

	return;
}

/*
 * init_shmem_barrier: Helper function to initialize a pthread barrier with a
 * desired waiter count.
 *
 * @barrier		Pthread barrier structure
 * @attr		Pthread barrier attribute structure
 * @waiter_count	Number of processes which will synchronize on the
 * 			barrier
 */
static void init_shmem_barrier (pthread_barrier_t* barrier,
				pthread_barrierattr_t* attr,
				int waiter_count)
{
	int ret;

	ret = pthread_barrier_init (barrier, attr, waiter_count);
	rtg_assert (!ret,  "Failed to initialize pthread barrier");
	
	return;
}

/*
 * destroy_shmem_barrier: Remove a (shared-memory) based pthread barrier
 * object.
 *
 * @barrier		Address of pthread barrier to destory
 */
static void destroy_shmem_barrier (pthread_barrier_t* barrier)
{
	int ret;

	ret = pthread_barrier_destroy (barrier);
	rtg_assert (!ret, "Failed to destroy pthread barrier");

	return;
}

/*
 * release_shared_memory: Release memory that has been previously mmaped.
 *
 * @addr		Shared memory address to unmap
 * @size		Size of the mapped region
 */
static void release_shared_memory (void* addr, size_t size)
{
	int ret;

	ret = munmap (addr, size);
	rtg_assert (!ret, "Failed to unmap shared memory");

	return;
}

/*
 * delete_shared_file: Helper function for deleting a file from the file
 * system.
 *
 * @shared_file		Name of the file to delete
 */
static void delete_shared_file (char* shared_file)
{
	int ret;

	ret = remove (shared_file);
	rtg_assert (!ret, "Failed to delete shared file");

	return;
}

/*
 * budget_to_events: Helper function to convert given budget (in MB/sec) to LLC
 * miss events for the platform at hand.
 *
 * @budget		Memory usage budget in MB/sec
 * @return		LLC miss events for the given budget
 */
static inline uint64_t budget_to_events (int budget)
{
	uint64_t events;

	/*
	 * Given budget is in MB/sec. We want to convert it into number of LLC
	 * miss events for THIS platform. The following steps explain the
	 * calculation involved:
	 *
	 * budget_in_bps         = budget_in_mbps * 1024 * 1024
	 * llc_misses_per_sec    = budget_in_bps / llc_line_size
	 * llc_misses_per_period = llc_misses_per_sec *
	 *				regulation_period_in_sec
	 *
	 * Hence we end up with the following short formula.
	 */
	events = ((budget << 20) >> LLC_LINE_SIZE_SHIFT) *
					REGULATION_PERIOD_SEC;

	return events;
}

/*
 * register_gang_with_kernel: Helper function to make the system call for
 * registering a virtual gang with the given parameters with the kernel.
 *
 * @id			Integer id issued by RT-Gang daemon
 * @budget		Memory usage budget for corunning best-effort processes
 * 			in MBytes/sec
 */
static void register_gang_with_kernel (int id, int budget)
{
	int ret;
	uint64_t events;

	events = (budget < 0)? 0 : budget_to_events (budget);
	ret = syscall (NR_RTG_SYSCALL, -1, id, events);
	rtg_assert (ret >= 0, "Failed to register virtual gang. Make sure "
			"that the process is real-time (FIFO or Deadline)");

	return;
}


/*
 * rtg_daemon_cleanup: Interface function for deleting shared memory based
 * objects created on behalf of a client by RT-Gang daemon.
 *
 * @barrier		Address of pthread barrier object in shared memory
 * @id			Integer id issued by RT-Gang daemon
 */
void rtg_daemon_cleanup (pthread_barrier_t* barrier, int id)
{
	PRINT_BARRIER_FILENAME (barrier_file, id);
	destroy_shmem_barrier (barrier);
	release_shared_memory ((void *)barrier, sizeof (pthread_barrier_t));
	delete_shared_file (barrier_file);

	return;
}

/*
 * rtg_daemon_setup: Interface function for creating a shared memory barrier on
 * behalf of RT-Gang daemon process.
 *
 * @id			Integer id issued by RT-Gang daemon
 * @waiter_count	Number of processes which will synchronize on the
 * 			barrier
 * @return		Pthread barrier object in shared memory
 */
pthread_barrier_t* rtg_daemon_setup (int id, int waiter_count)
{
	int fd;
	pthread_barrierattr_t attr;
	pthread_barrier_t *shmem_barrier;
	PRINT_BARRIER_FILENAME (barrier_file, id);

	fd = open_shared_file (barrier_file, O_RDWR | O_CREAT | O_TRUNC);
	seek_and_set_file (fd, sizeof (pthread_attr_t));
	set_pthread_attr_shared (&attr);
	shmem_barrier = map_pthread_barrier (fd);
	init_shmem_barrier (shmem_barrier, &attr, waiter_count);

	return shmem_barrier;
}

/*
 * rtg_member_setup: Interface function for setting up virtual gang parameters
 * for the caller. This includes registering the given virtual gang ID in the
 * caller's task structure and mapping a shared memory based synchronization
 * barrier into the caller's address space.
 *
 * @id			Integer id issued by RT-Gang daemon
 * @budget		Memory usage budget for corunning best-effort processes
 * 			in MBytes/sec
 * @return		Pthread barrier object in shared memory
 */
pthread_barrier_t* rtg_member_setup (int id, int budget)
{
	int fd;
	pthread_barrier_t *shmem_barrier;
	PRINT_BARRIER_FILENAME (barrier_file, id);

	rtg_assert (CHECK_BUDGET (budget), BUDGET_ERROR_MSG);
	register_gang_with_kernel (id, budget);
	fd = open_shared_file (barrier_file, O_RDWR);
	shmem_barrier = map_pthread_barrier (fd);

	return shmem_barrier;
}

/*
 * rtg_member_sync: Interface function for synchronizing on barrier between
 * virtual gang members.
 *
 * @barrier		Data structure of shared memory based barrier object
 */
void rtg_member_sync (pthread_barrier_t* barrier)
{
	pthread_barrier_wait (barrier);

	return;
}
