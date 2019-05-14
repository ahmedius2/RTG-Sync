#ifndef __RTG_LIB_H__
#define __RTG_LIB_H__

#include <pthread.h>

static inline void rtg_assert (bool assertion, char* msg)
{
	if (assertion)
		return;

	perror (msg);
	exit (EXIT_FAILURE);
}

pthread_barrier_t* rtg_daemon_setup (char* shared_file, int waiter_count);
pthread_barrier_t* rtg_member_setup (char* shared_file);
void rtg_member_sync (pthread_barrier_t* barrier);

#endif /* __RTG_LIB_H__ */
