/******************************************************************************
 * File:	rtg_lib.c
 * Description:	Shared library which provides various virtual gang related
 * 		utilities including registering a virtual gang member with the
 * 		kernel, synchronization between virtual gang members etc.
 * Author:	wali@ku.edu
 *****************************************************************************/
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
 * rtg_daemon_cleanup: Interface function for deleting shared memory based
 * objects created on behalf of a client by RT-Gang daemon.
 *
 * @barrier		Address of pthread barrier object in shared memory
 * @shared_file		Name of the file used for memory mapping
 */
void rtg_daemon_cleanup (pthread_barrier_t* barrier,
			 char* shared_file)
{
	destroy_shmem_barrier (barrier);
	release_shared_memory ((void *)barrier, sizeof (pthread_barrier_t));
	delete_shared_file (shared_file);

	return;
}

/*
 * rtg_daemon_setup: Interface function for creating a shared memory barrier on
 * behalf of RT-Gang daemon process.
 *
 * @shared_file		Full (path) name of the file which will be used for
 *			memory-mapping the barrier
 * @waiter_count	Number of processes which will synchronize on the
 * 			barrier
 * @return		Pthread barrier object in shared memory
 */
pthread_barrier_t* rtg_daemon_setup (char* shared_file, int waiter_count)
{
	int fd;
	pthread_barrierattr_t attr;
	pthread_barrier_t *shmem_barrier;

	fd = open_shared_file (shared_file, O_RDWR | O_CREAT | O_TRUNC);
	seek_and_set_file (fd, sizeof (pthread_attr_t));
	set_pthread_attr_shared (&attr);
	shmem_barrier = map_pthread_barrier (fd);
	init_shmem_barrier (shmem_barrier, &attr, waiter_count);

	return shmem_barrier;
}

/*
 * rtg_member_setup: Interface function for mapping a shared memory based
 * barrier to the calling process' address space.
 *
 * @shared_file		Full (path) name of the file which was used for
 *			memory-mapping the barrier by the RT-Gang daemon
 * @return		Pthread barrier object in shared memory
 */
pthread_barrier_t* rtg_member_setup (char* shared_file)
{
	int fd;
	pthread_barrier_t *shmem_barrier;

	fd = open_shared_file (shared_file, O_RDWR);
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
