#include "rtg_lib.h"

static int open_shared_file (char* shared_file, int flags)
{
	int fd;

	fd = open (shared_file, flags);
	rtg_assert (fd >= 0, "Failed to Open Shared File");

	return fd;
}

static void seek_and_set_file (int fd, size_t offset)
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

static void set_pthread_attr_shared (pthread_barrierattr_t* attr)
{
	int ret;

	ret = pthread_barrierattr_setpshared (attr, PTHREAD_PROCESS_SHARED);
	rtg_assert (!ret, "Failed to set pthread attribute to shared");

	return;
}

static void init_shmem_barrier (pthread_barrier_t* barrier,
				pthread_barrierattr_t* attr,
				int waiter_count)
{
	int ret;

	ret = pthread_barrier_init (barrier, attr, waiter_count);
	rtg_assert (!ret,  "Failed to initialize pthread barrier");
	
	return;
}

void rtg_daemon_setup (char* shared_file, int waiter_count)
{
	int fd;
	pthread_barrierattr_t attr;
	pthread_barrier_t *shmem_barrier;

	fd = open_shared_file (shared_file, O_RDWR | O_CREAT | O_TRUNC);
	seek_and_set_file (fd, sizeof (pthread_attr_t));
	set_pthread_attr_shared (&attr);
	shmem_barrier = map_pthread_barrier (fd);
	init_shmem_barrier (shmem_barrier, &attr, waiter_count);

	return;
}

pthread_barrier_t* rtg_member_setup (char* shared_file)
{
	int fd;
	pthread_barrier_t *shmem_barrier;

	fd = open_shared_file (shared_file, O_RDWR);
	shmem_barrier = map_pthread_barrier (fd);

	return shmem_barrier;
}

void rtg_member_sync (pthread_barrier_t* barrier)
{
	pthread_barrier_wait (barrier);

	return;
}
