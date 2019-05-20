#ifndef __RTG_LIB_H__
#define __RTG_LIB_H__

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>
#include <pthread.h>
#include <stdbool.h>
#include <sys/mman.h>

#define BARRIER_FILENAME_LEN	(64)
#define BARRIER_FILENAME_FMT	"/tmp/%d.bar"
#define PRINT_BARRIER_FILENAME(buf, id)				\
	char buf [BARRIER_FILENAME_LEN];			\
	bzero (buf, BARRIER_FILENAME_LEN);			\
	sprintf (buf, BARRIER_FILENAME_FMT, id)

static inline void rtg_assert (bool assertion, char* msg)
{
	if (assertion)
		return;

	perror (msg);
	exit (EXIT_FAILURE);
}

pthread_barrier_t* rtg_member_setup (int id);
void rtg_member_sync (pthread_barrier_t* barrier);
pthread_barrier_t* rtg_daemon_setup (int id, int waiter_count);
void rtg_daemon_cleanup (pthread_barrier_t* barrier, int id);

#endif /* __RTG_LIB_H__ */
