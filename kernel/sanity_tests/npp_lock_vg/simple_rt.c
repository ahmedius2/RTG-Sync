#include <time.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <getopt.h>
#include <assert.h>
#include <stdbool.h>
#include "rtg_lib.h"

#define WARN			(1U)
#define INFO			(2U)

#define SECS(ts)		(ts / 1000UL)
#define MSECS(ts)		(ts % 1000UL)
#define MS_TO_NANOS(ts)		(ts * 1000000ULL)
#define GET_LOCK_INFO(tcb)	(&(tcb)->lock_info)
#define GET_PERIODICITY(tcb)	(&(tcb)->periodicity)
#define GET_VG_INFO(tcb)	(&(tcb)->virtual_gang)

#define IS_VIRTUAL_GANG(tcb)	(GET_VG_INFO(tcb)->id != 0)

#define TSPEC_TO_MS(tspec)					\
	(tspec.tv_sec * 1000UL + tspec.tv_nsec / 1000000UL)

#define TSPEC_TO_US(tspec)					\
	(tspec.tv_sec * 1000000UL + tspec.tv_nsec / 1000UL)

#define debug_printf(lvl, format, ...)				\
do {								\
	if (lvl <= debug_level)					\
		printf(format, ##__VA_ARGS__);			\
} while (0);

typedef struct periodicity_control_block {
	uint32_t 		current_job_id;
	struct timespec 	first_activation;
	struct timespec 	current_activation;
} pcb_t;

typedef struct lock_info {
	uint32_t		delay_ms;
	uint32_t		duration_ms;
} lock_info_t;

typedef struct virtual_gang_info {
	uint32_t 		id;
	pthread_barrier_t* 	barrier;
} vg_info_t;

typedef struct task_control_block {
	uint32_t 		jobs;
	uint32_t 		wcet_ms;
	uint32_t 		period_ms;

	pcb_t 			periodicity;
	vg_info_t 		virtual_gang;
	lock_info_t		lock_info;
} tcb_t;

void print_usage(char** argv)
{
	printf("Usage: $ %s [<options>]\n\n", argv[0]);
	printf("  -c: compute time of the periodic task. Default = 5msec\n");
	printf("  -p: periodic of the periodic task. Default = 10msec\n");
	printf("  -j: number of jobs to execute. Default = 100\n");
	printf("  -v: virtual gang id. Default = 0\n");
	printf("  -l: lock duration. Default = 0\n");
	printf("  -y: lock delay. Default = 0\n");
	printf("  -d: debug level. Default = 0\n");
	printf("  -h: print usage\n\n");

	return;
}

/*
 * Global debug level which controls the amount of the information printed
 * by this application to the stdout.
 *
 * 0 : Only critical messages
 * 1 : Print warnings
 * 2 : Print everything
 */
static int debug_level = 0;

void check_task_params(tcb_t* task)
{
	uint32_t lock_ops_time;

	if (task->wcet_ms >= task->period_ms) {
		printf("[ERROR] WCET <%u> must be less than period <%u>!\n",
			task->wcet_ms, task->period_ms);

		exit(EXIT_FAILURE);
	}

	lock_ops_time = GET_LOCK_INFO(task)->delay_ms +
		GET_LOCK_INFO(task)->duration_ms;

	if (task->wcet_ms <= lock_ops_time) {
		printf("[ERROR] WCET <%u> must accomodate lock ops <%u>!\n",
			task->wcet_ms, lock_ops_time);

		exit(EXIT_FAILURE);
	}

	return;
}

void process_one_activation(tcb_t* task)
{
	int err;
	bool locked = false;
	struct timespec cur_time_tspec;
	uint32_t cur_ts_us, job_start_ts_us, job_end_ts_us, lock_start_ts_us,
		 lock_end_ts_us;

	err = clock_gettime(CLOCK_MONOTONIC, &cur_time_tspec);
	assert(err == 0);
	job_start_ts_us = TSPEC_TO_US(cur_time_tspec);

	err = clock_gettime(CLOCK_THREAD_CPUTIME_ID, &cur_time_tspec);
	assert(err == 0);
	cur_ts_us = TSPEC_TO_US(cur_time_tspec);

	lock_start_ts_us = cur_ts_us + (GET_LOCK_INFO(task)->delay_ms * 1000);
	lock_end_ts_us = lock_start_ts_us +
		(GET_LOCK_INFO(task)->duration_ms * 1000);
	job_end_ts_us =  cur_ts_us + (task->wcet_ms * 1000);

	while(cur_ts_us < job_end_ts_us) {
		err = clock_gettime(CLOCK_THREAD_CPUTIME_ID, &cur_time_tspec);
		assert(err == 0);
		cur_ts_us = TSPEC_TO_US(cur_time_tspec);

		if (!locked && ((cur_ts_us >= lock_start_ts_us) &&
					(cur_ts_us < lock_end_ts_us))) {
			npp_lock();
			locked = true;
		}

		if (locked && (cur_ts_us >= lock_end_ts_us)) {
			npp_unlock();
			locked = false;
		}
	}

	err = clock_gettime(CLOCK_MONOTONIC, &cur_time_tspec);
	job_end_ts_us = TSPEC_TO_US(cur_time_tspec);

	debug_printf(INFO, "job=%-3u start=%u end=%u dur=%u\n",
			GET_PERIODICITY(task)->current_job_id, job_start_ts_us,
			job_end_ts_us, job_end_ts_us - job_start_ts_us);

	return;
}

void sleep_until_next_activation(tcb_t *task)
{
	int err;

	do {
		err = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME,
				&GET_PERIODICITY(task)->current_activation,
				NULL);
	} while (err != 0 && errno == EINTR);

	assert(err == 0);

	return;
}

void timespec_update(struct timespec* t1, uint32_t period_ms)
{
	uint64_t nsecs = t1->tv_nsec + MS_TO_NANOS(period_ms);

	t1->tv_sec += nsecs / 1000000000ULL;
	t1->tv_nsec = nsecs % 1000000000ULL;

	return;
}

void process_activations(tcb_t* task)
{
	int err;

	GET_PERIODICITY(task)->current_job_id = 1;

	/*
	 * If running as part of a virtual gang, synchronize on the shared
	 * memory barrier before starting periodic execution.
	 */
	if (IS_VIRTUAL_GANG(task))
		rtg_member_sync(GET_VG_INFO(task)->barrier);

	err = clock_gettime(CLOCK_MONOTONIC,
			&GET_PERIODICITY(task)->first_activation);
	assert(err == 0);

	debug_printf(INFO, "First Activation = %lu\n",
			TSPEC_TO_MS(GET_PERIODICITY(task)->first_activation));

	GET_PERIODICITY(task)->current_activation =
		GET_PERIODICITY(task)->first_activation;

	while (1) {
		sleep_until_next_activation(task);
		process_one_activation(task);
		GET_PERIODICITY(task)->current_job_id++;

		if (GET_PERIODICITY(task)->current_job_id > task->jobs)
			break;

		timespec_update(&GET_PERIODICITY(task)->current_activation,
				task->period_ms);

		debug_printf(INFO, "Next Activation = %lu\n",
			TSPEC_TO_MS(GET_PERIODICITY(task)->current_activation));
	}

	return;
}

int main(int argc, char** argv)
{
	int opt;
	tcb_t tcb = {
		.jobs = 100,
		.wcet_ms = 5,
		.period_ms = 10,
		.virtual_gang.id = 0
	};

	while ((opt = getopt(argc, argv, "c:p:j:v:d:l:y:h")) != -1) {
		switch (opt) {
			case 'c':
				tcb.wcet_ms = strtol(optarg, NULL, 0);
				break;

			case 'p':
				tcb.period_ms = strtol(optarg, NULL, 0);
				break;

			case 'j':
				tcb.jobs = strtol(optarg, NULL, 0);
				break;

			case 'l':
				GET_LOCK_INFO(&tcb)->duration_ms =
					strtol(optarg, NULL, 0);
				break;

			case 'y':
				GET_LOCK_INFO(&tcb)->delay_ms =
					strtol(optarg, NULL, 0);
				break;

			case 'v':
				GET_VG_INFO(&tcb)->id = strtol(optarg, NULL, 0);
				break;

			case 'd':
				debug_level = strtol(optarg, NULL, 0);
				break;

			case 'h':
			default:
				print_usage(argv);
				exit(EXIT_SUCCESS);
		}
	}

	check_task_params(&tcb);

	if (IS_VIRTUAL_GANG(&tcb)) {
		GET_VG_INFO(&tcb)->barrier =
			rtg_member_setup(GET_VG_INFO(&tcb)->id, 0, 0, 0);

		assert(GET_VG_INFO(&tcb)->barrier != NULL);
	}

	printf("[PARAMS] WCET=%ums Period=%ums Jobs=%u Virtual=%u\n",
			tcb.wcet_ms, tcb.period_ms, tcb.jobs,
			GET_VG_INFO(&tcb)->id);

	process_activations(&tcb);
	printf("Done!\n");

	return 0;
}
