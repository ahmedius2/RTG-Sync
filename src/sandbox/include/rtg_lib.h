#ifndef __RTG_LIB_H__
#define __RTG_LIB_H__

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <sys/mman.h>

static inline void rtg_assert (bool assertion, char* msg)
{
	if (assertion)
		return;

	perror (msg);
	exit (EXIT_FAILURE);
}

void rtg_member_sync (pthread_barrier_t* barrier);
pthread_barrier_t* rtg_member_setup (char* shared_file);
pthread_barrier_t* rtg_daemon_setup (char* shared_file, int waiter_count);
void rtg_daemon_cleanup (pthread_barrier_t* barrier, char* shared_file);

#endif /* __RTG_LIB_H__ */
