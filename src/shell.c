#define _GNU_SOURCE
#include <fcntl.h>
#include <errno.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>

#define TAU_1		"/home/nvidia/ssd/gits/RT-Gang/experiments/tx2/sync/src/bandwidth/tau_1"
#define TAU_2		"/home/nvidia/ssd/gits/RT-Gang/experiments/tx2/sync/src/bandwidth/tau_2"
#define SHARED_FILE	"/tmp/barrier.bin"

/*
 * set_affinity: Pin calling process to the specified CPU
 */
void set_affinity (int cpu)
{
	int num_processors;
	cpu_set_t cmask;
	int ret = 0;

	num_processors = sysconf (_SC_NPROCESSORS_CONF);
	CPU_ZERO (&cmask);
	CPU_SET (cpu, &cmask);

	ret = sched_setaffinity (0, num_processors, &cmask);
	if (ret < 0) {
		perror ("[ERROR] Failed to set affinity");
		exit (-1);
	}

	return;
}

/*
 * set_priority: Set priority of calling process under SCHED_FIFO
 */
void set_priority (int priority)
{
	struct sched_param param;
	int ret = 0;

	param.sched_priority = priority;
	ret = sched_setscheduler (0, SCHED_FIFO, &param);
	if (ret < 0) {
		perror ("[ERROR] Failed to set priority");
		exit (-1);
	}

	return;
}

/*
 * open_shared_file: Open the file which will be used for memory mapping
 * between processes
 */
int open_shared_file (int flags)
{
	int fd;

	fd = open (SHARED_FILE, flags);
	if (fd < 0) {
		perror ("[ERROR] Failed to open file");
		exit (-1);
	}

	return fd;
}

/*
 * seek_and_set_file: Set seek to the end of pthread barrier structure in the
 * file and write a dummy byte at the end
 */
void seek_and_set_file (int fd, size_t offset)
{
	int ret;

	ret = lseek (fd, offset - 1, SEEK_SET);
	if (ret < 0) {
		perror ("[ERROR] Failed to reposition the file");
		exit (-1);
	}

	ret = write (fd, "", 1);
	if (ret < 0) {
		perror ("[ERROR] Failed to write to the shared file");
		exit (-1);
	}

	return;
}

/*
 * map_pthread_barrier: Memory map the pthread barrier in the shared file in
 * the calling processes' address space
 */
pthread_barrier_t* map_pthread_barrier (int fd)
{
	pthread_barrier_t *shmem_barrier;
	
	shmem_barrier = (pthread_barrier_t *) mmap(NULL,
						   sizeof (pthread_barrier_t),
						   PROT_READ | PROT_WRITE,
						   MAP_SHARED, fd, 0);

	if (shmem_barrier == MAP_FAILED) {
		perror ("[ERROR] Failed to mmap pthread barrier");
		exit (-1);
	}

	return shmem_barrier;
}

static inline void set_pthread_attr_shared (pthread_barrierattr_t* attr)
{
	int ret;

	ret = pthread_barrierattr_setpshared (attr, PTHREAD_PROCESS_SHARED);
	if (ret) {
		perror ("[ERROR] Failed to set pthread attribute to shared");
		exit (-1);
	}

	return;
}

static inline void init_shmem_barrier (pthread_barrier_t* barrier,
				       pthread_barrierattr_t* attr,
				       int waiter_count)
{
	int ret;

	ret = pthread_barrier_init (barrier, attr, waiter_count);
	if (ret) {
		perror ("[ERROR] Failed to initialize pthread barrier");
		exit (-1);
	}
	
	return;
}

/*
 * create_shmem_barrier: Create a pthread barrier in the shared memory by
 * mapping a pre-selected file. Initialize the barrier to the given count
 */
pthread_barrier_t* create_shmem_barrier (int waiter_count)
{
	int fd;
	pthread_barrierattr_t attr;
	pthread_barrier_t *shmem_barrier;

	fd = open_shared_file (O_RDWR | O_CREAT | O_TRUNC);
	seek_and_set_file (fd, sizeof (pthread_attr_t));
	set_pthread_attr_shared (&attr);
	shmem_barrier = map_pthread_barrier (fd);
	init_shmem_barrier (shmem_barrier, &attr, waiter_count);

	return shmem_barrier;
}

int main (void)
{
	pid_t pid1, pid2;
	pthread_barrier_t *barrier;

	set_affinity (5);
	set_priority (6);
	barrier = create_shmem_barrier (2);

	pid1 = fork ();
	if (pid1 == 0) {
		char* const argv [] = {"tau_1",
					"-m", "256",
					"-i", "150000",
					"-t", "5",
					"-c", "0",
					"-p", "5",
					"-v",
					NULL};

		execv (TAU_1, argv);
		printf ("[ERROR] Failed to execute <tau_1>\n");
	}

	pid2 = fork ();
	if (pid2 == 0) {
		char* const argv [] = {"tau_2",
					"-m", "256",
					"-i", "100000",
					"-t", "5",
					"-c", "3",
					"-p", "5",
					"-v",
					NULL};

		execv (TAU_2, argv);
		printf ("[ERROR] Failed to execute <tau_2>\n");
	}

	waitpid (pid1, NULL, 0);
	waitpid (pid2, NULL, 0);

	return 0;
}
