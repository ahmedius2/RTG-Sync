#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/wait.h>

/*
 * set_affinity: Pin calling process to the specified CPU
 */
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
		perror ("[ERROR] Failed to set affinity.");
		exit (-1);
	}

	return;
}

/*
 * set_priority: Set priority of calling process under SCHED_FIFO
 */
static inline void set_priority (int priority)
{
	struct sched_param param;
	int ret = 0;

	param.sched_priority = priority;
	ret = sched_setscheduler (0, SCHED_FIFO, &param);
	if (ret < 0) {
		perror ("[ERROR] Failed to set priority.");
		exit (-1);
	}

	return;
}

int main (void)
{
	pid_t pid1, pid2;
	set_affinity (5);
	set_priority (6);

	pid1 = fork ();
	if (pid1 == 0) {
		/*
		 * Execute: taskset -c 3 chrt -f 5 tau_1 -m 256 -i 1500 --jobs 100 --period 50
		 */
		set_affinity (3);
		set_priority (5);

		char* const argv [] = {"tau_1",
					"-m", "256",
					"-i", "1500",
					"--jobs", "100",
					"--period", "50",
					NULL};
		execv ("/usr/bin/tau_1", argv);
		printf ("[ERROR] Failed to execute <tau_1>\n");
	}

	pid2 = fork ();
	if (pid2 == 0) {
		/*
		 * Execute: taskset -c 4 chrt -f 5 tau_2 -m 256 -i 1000 --jobs 100 --period 50
		 */
		set_affinity (4);
		set_priority (5);

		char* const argv [] = {"tau_2",
					"-m", "256",
					"-i", "1000",
					"--jobs", "100",
					"--period", "50",
					NULL};
		execv ("/usr/bin/tau_2", argv);
		printf ("[ERROR] Failed to execute <tau_2>\n");
	}

	waitpid (pid1, NULL, 0);
	waitpid (pid2, NULL, 0);

	return 0;
}
