#ifndef __RTG_LIB_H__
#define __RTG_LIB_H__

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <strings.h>
#include <pthread.h>
#include <stdbool.h>
#include <sys/mman.h>

/*
 * Shared memory based barrier will be created in the following file for use by
 * virtual gang(s). This is the only place this file is defined so it is safe to
 * change the path as needed if a different location needs to be used as long
 * as the format is kept the same i.e., %d in the name to assign sequential IDs
 * for dynamically created barrier files.
 */
#define BARRIER_FILENAME_LEN	(64)
#define BARRIER_FILENAME_FMT	"/tmp/%d.bar"
#define PRINT_BARRIER_FILENAME(buf, id)				\
	char buf [BARRIER_FILENAME_LEN];			\
	bzero (buf, BARRIER_FILENAME_LEN);			\
	sprintf (buf, BARRIER_FILENAME_FMT, id)

/*
 * Define IDs of the platforms on which this library is used. These IDs will be
 * used in platform dependent macros.
 */
#define ID_TX2			(0x1)
#define ID_PI3			(0x2)

/* Modify this macro based on the platform at hand */
#define THIS_PLATFORM_ID	ID_TX2

/* PLATFORM DEPENDENT DECLARATIONS */
#if (THIS_PLATFORM_ID == ID_TX2)
#define NR_RTG_SYSCALL		(245)
#define REGULATION_PERIOD_MSEC	(1)

/* LLC_LINE_SIZE_SHIFT = log2 (LLC_LINE_SIZE_IN_BYTES) */
#define LLC_LINE_SIZE_BYTES	(64)
#define LLC_LINE_SIZE_SHIFT	(6)

/*
 * These values are defined to sanity check the (corun) memory usage budget
 * requested by a virtual gang. A budget greater than the max below does not
 * make sense for the platform at hand.
 *
 * Note that budget value = 0 is also allowed. It means that the caller
 * does not want to change the currently set budget.
 */
#define MAX_BUDGET_MBPS		(100000)
#define CHECK_BUDGET(x)		(x <= MAX_BUDGET_MBPS)
#define BUDGET_ERROR_MSG					\
	("Given budget is out of bounds for this platform")
#else
#error Platform ID not supported
#endif

static inline void rtg_assert (bool assertion, char* msg)
{
	if (assertion)
		return;

	perror (msg);
	exit (EXIT_FAILURE);
}

/*
 * INTERFACE FUNCTIONS
 * The functions declared below are meant to be called by other programs (which
 * link this library) that want to use this library's services
 */
pthread_barrier_t* rtg_member_setup (int id, unsigned int mem_read_budget,
				unsigned int mem_write_budget);
void rtg_member_sync (pthread_barrier_t* barrier);
pthread_barrier_t* rtg_daemon_setup (int id, int waiter_count);
void rtg_daemon_cleanup (pthread_barrier_t* barrier, int id);

#endif /* __RTG_LIB_H__ */
