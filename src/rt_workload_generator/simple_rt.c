/*
 * Periodic Workload Generator
 *
 * This application can be used to generate workloads according to the
 * recurrent (periodic) real-time task models. It has been written to test and
 * explore the real-time scheduling under the Linux kernel.
 *
 * CREDIT:
 * The template of the generic real-time task used in this application is
 * copied from the following source:
 *
 *     https://sigbed.org/2020/09/05/liu-and-layland-and-linux-
 *     a-blueprint-for-proper-real-time-tasks/
 */
#define _GNU_SOURCE
#include <time.h>
#include <sched.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <getopt.h>
#include <assert.h>
#include <stdbool.h>
#include <pthread.h>
#include "rtg_sync_framework/rtg_lib.h"

#define WARN			(1U)
#define INFO			(2U)
#define VERBOSE			(3U)

#define MAX_THREAD_COUNT	(32U)

#define SECS(ts)		(ts / 1000UL)
#define MSECS(ts)		(ts % 1000UL)
#define MS_TO_NANOS(ts)		(ts * 1000000ULL)

#define SYNC_OFFSET_NS		(10UL * 1000000000UL)

#define TSPEC_TO_MS(tspec)					\
	(tspec.tv_sec * 1000UL + tspec.tv_nsec / 1000000UL)

#define TSPEC_TO_US(tspec)					\
	(tspec.tv_sec * 1000000UL + tspec.tv_nsec / 1000UL)

#define TSPEC_TO_NS(tspec)					\
	(tspec.tv_sec * 1000000000UL + tspec.tv_nsec)

#define GET_NS_TIMESTAMP(ts_var)				\
do {								\
	int tmp_err;						\
	struct timespec tmp_tspec;				\
	tmp_err = clock_gettime(CLOCK_REALTIME, &tmp_tspec);	\
	assert(tmp_err == 0);					\
	ts_var = TSPEC_TO_NS(tmp_tspec);			\
} while (0);

#define TIME_FORMAT						\
		"%ld.%ld.%ld"

#define TIMESTAMP_TO_TIME(tstamp)				\
	(tstamp / 1000000000UL),				\
	((tstamp % 1000000000UL) / 1000000UL),			\
	(((tstamp % 1000000000UL) % 1000000UL) / 1000UL)

#define debug_printf(lvl, format, ...)				\
do {								\
	if (lvl <= debug_level)					\
		printf(format, ##__VA_ARGS__);			\
} while (0);

typedef struct lock_info {
	uint32_t		delay_ms;
	uint32_t		duration_ms;
} lock_info_t;

typedef struct virtual_gang_info {
	uint32_t 		id;
	pthread_barrier_t* 	barrier;
} vgang_info_t;

typedef struct rt_params {
	uint32_t 		wcet_ms;
	uint32_t		affinity;
	uint32_t 		period_ms;
	uint32_t 		num_of_jobs;
	uint32_t		num_of_threads;

	lock_info_t*		npp_lock;
	vgang_info_t* 		virtual_gang;
} rt_params_t;

typedef struct thread_control_block {
	pthread_t		pthread;
	uint32_t 		current_job_id;
	struct timespec 	first_activation;
	struct timespec 	current_activation;

	rt_params_t const*	rt_params;
} tcb_t;

void print_usage(char** argv)
{
	printf("Usage: $ %s [<options>]\n\n", argv[0]);
	printf("  -c: compute time of the periodic task. Default = 5msec\n");
	printf("  -p: periodic of the periodic task. Default = 10msec\n");
	printf("  -a: cpu affinity of the main thread. Default = 0\n");
	printf("  -j: number of jobs to execute. Default = 100\n");
	printf("  -v: virtual gang id. Default = 0\n");
	printf("  -n: num of threads. Default = 1\n");
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
 * 2 : Print (non-verbose) informational messages and warnings
 * 3 : Print everything
 */
static int debug_level = 0;
static long sync_time_ns = 0;
static long tmp_cur_time = 0;
static bool debug_switch_vgang = false;

void check_rt_params(rt_params_t* rt_params)
{
	uint32_t lock_ops_time;
	uint32_t num_of_processors;

	if (rt_params->wcet_ms >= rt_params->period_ms) {
		printf("[ERROR] WCET <%u> must be less than period <%u>!\n",
			rt_params->wcet_ms, rt_params->period_ms);

		exit(EXIT_FAILURE);
	}

	lock_ops_time = rt_params->npp_lock->delay_ms +
		rt_params->npp_lock->duration_ms;

	if (rt_params->wcet_ms <= lock_ops_time) {
		printf("[ERROR] WCET <%u> must accomodate lock ops <%u>!\n",
			rt_params->wcet_ms, lock_ops_time);

		exit(EXIT_FAILURE);
	}

	num_of_processors = sysconf(_SC_NPROCESSORS_ONLN);
	if (rt_params->num_of_threads > num_of_processors) {
		printf("[ERROR] # of threads <%u> must be less than / equal "
				"to the # of online processors <%u>!\n",
				rt_params->num_of_threads, num_of_processors);
		exit(EXIT_FAILURE);
	}

	return;
}

void process_one_activation(tcb_t* thread)
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

	lock_start_ts_us = cur_ts_us +
		(thread->rt_params->npp_lock->delay_ms * 1000);

	lock_end_ts_us = lock_start_ts_us +
		(thread->rt_params->npp_lock->duration_ms * 1000);

	job_end_ts_us =  cur_ts_us + (thread->rt_params->wcet_ms * 1000);

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

	debug_printf(VERBOSE, "job=%-3u start=%u end=%u dur=%u\n",
			thread->current_job_id, job_start_ts_us,
			job_end_ts_us, job_end_ts_us - job_start_ts_us);

	return;
}

void sleep_until_next_activation(tcb_t *thread)
{
	int err;

	do {
		err = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME,
				&thread->current_activation, NULL);
	} while (err != 0 && errno == EINTR);

	assert(err == 0);

	return;
}

void timespec_update(struct timespec* t1, uint32_t period_ms)
{
	static bool plus = true;
	uint64_t nsecs = t1->tv_nsec + MS_TO_NANOS(period_ms);

	if (debug_switch_vgang) {
		srand(time(NULL));
		unsigned long int jitter_nsec = (rand() % 10) * 1000;
		nsecs = plus? (nsecs + jitter_nsec) : (nsecs - jitter_nsec);
		plus = !plus;
	}

	t1->tv_sec += nsecs / 1000000000ULL;
	t1->tv_nsec = nsecs % 1000000000ULL;

	return;
}

void process_activations(void* arg)
{
	int err;
	long int time_till_sync;
	tcb_t* thread = (tcb_t *)arg;

	GET_NS_TIMESTAMP(tmp_cur_time);
	time_till_sync = sync_time_ns - tmp_cur_time;

	while (time_till_sync > 0) {
		GET_NS_TIMESTAMP(tmp_cur_time);
		time_till_sync = sync_time_ns - tmp_cur_time;
	}
	debug_printf(INFO, "[ SYNC ] Thread Synced!\n");

	thread->current_job_id = 1;
	err = clock_gettime(CLOCK_MONOTONIC, &thread->first_activation);
	assert(err == 0);

	thread->current_activation = thread->first_activation;
	debug_printf(VERBOSE, "First Activation = %lu\n",
			TSPEC_TO_MS(thread->first_activation));

	while (1) {
		sleep_until_next_activation(thread);
		process_one_activation(thread);
		thread->current_job_id++;

		if (thread->current_job_id > thread->rt_params->num_of_jobs)
			break;

		if (debug_switch_vgang && thread->current_job_id > 100) {
			register_gang_with_kernel(
					(thread->rt_params->virtual_gang->id +
					 1), 0, 0);
		}

		timespec_update(&thread->current_activation,
				thread->rt_params->period_ms);

		debug_printf(VERBOSE, "Next Activation = %lu\n",
			TSPEC_TO_MS(thread->current_activation));
	}

	return;
}

int main(int argc, char** argv)
{
	int ret, opt, num_of_processors;

	lock_info_t lock_info = {
		.delay_ms = 0,
		.duration_ms = 0
	};

	vgang_info_t vgang_info = {
		.id = 0,
		.barrier = NULL
	};

	rt_params_t params = {
		.wcet_ms = 5,
		.affinity = 0,
		.period_ms = 10,
		.num_of_jobs = 100,
		.num_of_threads = 1,
		.npp_lock = &lock_info,
		.virtual_gang = &vgang_info
	};

	cpu_set_t cmask;
	pthread_attr_t attr;
	pthread_attr_init(&attr);

	tcb_t threads[MAX_THREAD_COUNT];

	while ((opt = getopt(argc, argv, "a:n:c:p:j:v:d:s:l:y:xh")) != -1) {
		switch (opt) {
			case 'a':
				params.affinity = strtol(optarg, NULL, 0);
				break;

			case 'n':
				params.num_of_threads = strtol(optarg, NULL, 0);
				break;

			case 'c':
				params.wcet_ms = strtol(optarg, NULL, 0);
				break;

			case 'p':
				params.period_ms = strtol(optarg, NULL, 0);
				break;

			case 'j':
				params.num_of_jobs = strtol(optarg, NULL, 0);
				break;

			case 'l':
				lock_info.duration_ms =
					strtol(optarg, NULL, 0);
				break;

			case 'y':
				lock_info.delay_ms = strtol(optarg, NULL, 0);
				break;

			case 'v':
				vgang_info.id = strtol(optarg, NULL, 0);
				break;

			case 'd':
				debug_level = strtol(optarg, NULL, 0);
				break;

			case 's':
				sync_time_ns = strtol(optarg, NULL, 0) +
					SYNC_OFFSET_NS;
				break;

			case 'x':
				debug_switch_vgang = true;
				break;

			case 'h':
			default:
				print_usage(argv);
				exit(EXIT_SUCCESS);
		}
	}

	check_rt_params(&params);

	printf("[PARAMS] WCET=%ums Period=%ums Lock-Delay=%ums "
			"Lock-Duration=%ums Jobs=%u Virtual=%u "
			"Threads=%u Affinity=%u\n",
			params.wcet_ms, params.period_ms,
			lock_info.duration_ms, lock_info.delay_ms,
			params.num_of_jobs, vgang_info.id,
			params.num_of_threads, params.affinity);

	if (vgang_info.id > 0) {
		if (sync_time_ns != 0) {
			/******************************************************
			 * USE SYNC-POINT SYNCHRONIZATION
			 *****************************************************/

			/*
			 * Have we arleady missed the synchronization instant?
			 */
			GET_NS_TIMESTAMP(tmp_cur_time);
			long int time_till_sync = sync_time_ns - tmp_cur_time;

			if (time_till_sync < 0) {
				printf("[ ERROR] Sync time already missed!\n"
					  "\t Sync Time: " TIME_FORMAT "\n"
					  "\t Curr Time: " TIME_FORMAT "\n",
					  TIMESTAMP_TO_TIME(sync_time_ns),
					  TIMESTAMP_TO_TIME(tmp_cur_time));
				exit(EXIT_FAILURE);
			} else {
				debug_printf(INFO, "[ SYNC ] SyncTime Offset: "
					  TIME_FORMAT "\n",
					  TIMESTAMP_TO_TIME(time_till_sync));
			}

			register_gang_with_kernel(vgang_info.id, 0, 0);
		} else {
			/******************************************************
			 * USE BARRIER SYNCHRONIZATION
			 *****************************************************/
			vgang_info.barrier = rtg_member_setup(vgang_info.id, 0,
					0);
			assert(vgang_info.barrier != NULL);

			/*
			 * Synchronize with other member tasks of the virtual gang
			 * before creating threads for periodic execution.
			 */
			rtg_member_sync(vgang_info.barrier);
		}
	}

	num_of_processors = sysconf(_SC_NPROCESSORS_ONLN);
	for (int i = 0; i < params.num_of_threads; i++){
		/*
		 * Once set, RT params cannot be modified from inside the
		 * thread control blocks.
		 */
		threads[i].rt_params = (rt_params_t const *)&params;
		pthread_create(&threads[i].pthread, &attr,
				(void *)process_activations,
				(void *)&threads[i]);

		CPU_ZERO(&cmask);
		CPU_SET((params.affinity + i) % num_of_processors, &cmask);

		ret = pthread_setaffinity_np(threads[i].pthread,
				sizeof(cpu_set_t), &cmask);
		assert(ret == 0);
	}

	for (int i = 0; i < params.num_of_threads; i++) {
		pthread_join(threads[i].pthread, NULL);
		printf("Thread-%d done!\n", i);
	}

	return 0;
}
