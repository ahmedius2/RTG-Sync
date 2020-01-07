/*
 * Copyright (C) 2012  Heechul Yun <heechul@illinois.edu>
 *               2012  Zheng <zpwu@uwaterloo.ca>
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 */

/**************************************************************************
 * Included Files
 **************************************************************************/
#define _GNU_SOURCE             /* See feature_test_macros(7) */
#include <fcntl.h>
#include <errno.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <sys/time.h>
#include <inttypes.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <sys/resource.h>

#include "rtg_lib.h"

/**************************************************************************
 * Public Definitions
 **************************************************************************/
#define CACHE_LINE_SIZE 		64
#ifdef __arm__
#  define DEFAULT_ALLOC_SIZE_KB 	4096
#else
#  define DEFAULT_ALLOC_SIZE_KB 	16384
#endif

#define IS_VIRTUAL_GANG()			\
	(globals.sched.vid >= 0)

/**************************************************************************
 * Public Types
 **************************************************************************/
typedef enum {
	READ,
	WRITE
} access_t;

typedef struct {
	access_t 		access_type;
	int			size;
	int*			ptr;
} mem_t;

typedef struct {
	int			start_time;
	unsigned		bytes_accessed;
} stats_t;

typedef struct {
	int			cpu;
	int			vid;
	int			prio;
	unsigned int		mem_read_budget;
	unsigned int		mem_write_budget;
	pthread_barrier_t 	*barrier;
} sched_t;

typedef struct {
	unsigned long		cmask;
	stats_t			stats;
	sched_t			sched;
	mem_t			memory;
	int 			max_duration;
	int 			max_iterations;
} global_vars_t;

/**************************************************************************
 * Global Variables
 **************************************************************************/
global_vars_t globals;

/**************************************************************************
 * Function Prototypes
 **************************************************************************/
void quit(int param);
static void bench_read(void);
static void bench_write(void);
static void print_setup(void);
static void usage(char* argv[]);
static void setup_signals(void);
static void allocate_memory(void);
static void populate_memory(void);
static void set_affinity (int cpu);
static int  get_timestamp_us(void);
static void setup_experiment(void);
static void set_priority (int priority);
static void perform_memory_accesses(void);
static void parse_cmd_args(int argc, char* argv[]);
extern void pagetype(char *pid_s);

static inline void set_affinity (int cpu)
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

static inline void set_priority (int priority)
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

static inline int get_timestamp_us(void)
{
	int timestamp;
	struct timeval time;

	gettimeofday(&time, NULL);
	timestamp = (time.tv_sec * 1000000) + time.tv_usec;

	return timestamp;
}

static inline void bench_read(void)
{
	int i;
	int64_t sum = 0;

	for (i = 0; i < globals.memory.size/sizeof(int); i += (CACHE_LINE_SIZE/sizeof(int))) {
		sum += globals.memory.ptr[i];
	}
	globals.stats.bytes_accessed += globals.memory.size;

	return;
}

static inline void bench_write(void)
{
	register int i;

	for (i = 0; i < globals.memory.size/sizeof(int); i += (CACHE_LINE_SIZE/sizeof(int))) {
		globals.memory.ptr[i] = i;
	}
	globals.stats.bytes_accessed += globals.memory.size;

	return;
}

static inline void allocate_memory(void)
{
	globals.memory.ptr = (int *)malloc(globals.memory.size);
	memset((char *)globals.memory.ptr, 1, globals.memory.size);

	return;
}

static inline void populate_memory(void)
{
	int i;

	for (i = 0; i < globals.memory.size/sizeof(int); i++)
		globals.memory.ptr[i] = i;

	return;
}

static inline void print_setup(void)
{
	printf("memsize=%d KB, type=%s, cpuid=%d, priority=%d\n",
	       globals.memory.size/1024,
	       ((globals.memory.access_type==READ) ?"read": "write"),
	       globals.sched.cpu, globals.sched.prio);
	printf("stop at %d\n", globals.max_duration);

	return;
}

static inline void setup_signals(void)
{
	signal(SIGINT, &quit);
	if (globals.max_duration > 0) {
		signal(SIGALRM, &quit);
		alarm(globals.max_duration);
	}

	return;
}

static inline void perform_memory_accesses(void)
{
	int i;
	globals.stats.start_time = get_timestamp_us();

	for (i=1;; i++) {
		switch (globals.memory.access_type) {
			case READ:
				bench_read();
				break;

			case WRITE:
				bench_write();
				break;

			default:
				printf("[ERROR] Invalid Access Type!\n");
				exit(1);
		}

		if ((globals.max_iterations > 0) && (i >= globals.max_iterations))
			break;
	}

	quit(0);

	return;
}

static inline void setup_virtual_gang (void)
{
	globals.sched.barrier = rtg_member_setup(globals.sched.vid,
			globals.cmask, globals.sched.mem_read_budget,
			globals.sched.mem_write_budget);

	return;
}

void setup_experiment(void)
{
	if (IS_VIRTUAL_GANG())
		setup_virtual_gang();

	allocate_memory();
	populate_memory();
	print_setup();
	setup_signals();

	return;
}

static inline void parse_cmd_args(int argc, char* argv[])
{
	int opt;

	while ((opt = getopt(argc, argv, "m:a:t:i:c:p:v:r:w:k:h")) != -1) {
		switch (opt) {
			case 'm':
				globals.memory.size = 1024 * strtol(optarg, NULL, 0);
				break;

			case 'a':
				if (!strncmp(optarg, "read", 4))
					globals.memory.access_type = READ;
				else if (!strncmp(optarg, "write", 5))
					globals.memory.access_type = WRITE;
				else
					exit(1);
				break;

			case 't':
				globals.max_duration = strtol(optarg, NULL, 0);
				break;

			case 'i':
				globals.max_iterations = strtol(optarg, NULL, 0);
				break;

			case 'c':
				globals.sched.cpu = strtol(optarg, NULL, 0);
				set_affinity(globals.sched.cpu);
				break;

			case 'p':
				globals.sched.prio = strtol(optarg, NULL, 0);
				set_priority(globals.sched.prio);
				break;

			case 'k':
				globals.cmask = parse_color_string(optarg);
				break;

			case 'v':
				globals.sched.vid = strtol(optarg, NULL, 0);
				break;

			case 'r':
				globals.sched.mem_read_budget = strtol (optarg, NULL, 0);
				break;

			case 'w':
				globals.sched.mem_write_budget = strtol (optarg, NULL, 0);
				break;

			case 'h':
				usage(argv);
				break;

			default:
				usage(argv);
				exit(1);
		}
	}

	return;
}

static inline void initialize_globals(void)
{
	globals.stats.bytes_accessed = 0;
	globals.memory.access_type = READ;
	globals.memory.size = DEFAULT_ALLOC_SIZE_KB * 1024;
	globals.max_duration = 5;
	globals.max_iterations = 0;
	globals.sched.cpu = -1;
	globals.sched.prio = -1;
	globals.sched.vid = -1;
	globals.sched.barrier = NULL;
	globals.sched.mem_read_budget = 0;
	globals.sched.mem_write_budget = 0;

	return;
}

void quit(int param)
{
	float bw;
	int my_pid;
	char pid_s [256];
	float dur_in_sec;
	float dur_in_usec;

	dur_in_usec = get_timestamp_us() - globals.stats.start_time;
	dur_in_sec = (float)dur_in_usec / 1000000;
	bw = (float)globals.stats.bytes_accessed / dur_in_sec / 1024 / 1024;

	printf("g_nread(bytes accessed) = %u\n", globals.stats.bytes_accessed);
	printf("elapsed = %.2f sec ( %.0f usec )\n", dur_in_sec, dur_in_usec);
	printf("B/W = %.2f MB/s | ", bw);
	printf("average = %.2f ns\n", (dur_in_usec*1000)/(globals.stats.bytes_accessed/CACHE_LINE_SIZE));

	my_pid = getpid();
	sprintf(pid_s, "%d", my_pid);
	pagetype(pid_s);

	exit(0);
}

static inline void usage(char* argv[])
{
	printf("-h: help\n");
	printf("Usage: $ %s [<option>]*\n\n", argv[0]);
	printf("-m: memory size in KB. deafult=4096\n");
	printf("-a: access type - read, write. default=read\n");
	printf("-i: iterations. 0 means indefinite. default=0\n");
	printf("-t: time to run in sec. 0 means indefinite. default=5. \n");
	printf("-c: cpu to execute on. If not specified, let the kernel decide\n");
	printf("-p: priority under SCHED_FIFO. If not specified, run as fair task\n");
	printf("-v: sync virtual gang process. If not specified, run independently\n");
	printf("-r: set budget for the memory read traffic. If not specified, do nothing\n");
	printf("-w: set budget for the memory write traffic. If not specified, do nothing\n");
	printf("\nExamples: \n$ bandwidth -m 8192 -c 3 -p 5 -a read -t 1\n  <- 8MB read for 1 secon on core 3 with SCHED_FIFO priority 5\n");
	exit(1);
}

int main(int argc, char* argv[])
{
	initialize_globals();
	parse_cmd_args(argc, argv);
	setup_experiment();

	if (IS_VIRTUAL_GANG())
		rtg_member_sync(globals.sched.barrier);

	/* This will start the actual memory access experiment */
	perform_memory_accesses();

	return 0;
}
