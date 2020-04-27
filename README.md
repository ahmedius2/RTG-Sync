# RTG-Sync: Virtual Gang based Scheduling of Parallel Real-Time Tasks
RTG-Sync is a scheduling framework which enables static grouping of real-time
tasks into singular schedulable entities, called virtual gangs, which are
executed one-at-a-time on all cores of a multicore platform. The **goal** of
RTG-Sync is to enable completely deterministic scheduling of real-time tasks on
COTS multicore platforms while preserving high system utilization in the
presence of shared hardware resource interference.

This repository contains the code and instructions for deploying RTG-Sync in a
Linux based system.

# Pre-Requisites
RTG-Sync was developed and tested on the following platform and software:
  - **Hardware**: NVIDIA Jetson TX-2
  - **Software**: Linux for Tegra r28.2.1 (Kernel v4.4.38)

To use RTG-Sync on a different Linux based platform, moderate porting effort
should be expected to change the patch for the respective kernel.

# Instructions
Following are the instructions for deploying RTG-Sync on L4T of Jetson TX-2.
For any other platform, please use the steps as appropriate for that platform.

## Kernel Setup
1. Flash the TX-2 board with OS image and drivers from
   [Jetpack-3.1](https://developer.nvidia.com/embedded/dlc/jetpack-l4t-3_1)

2. Once the board has rebooted, clone this repository into the board

```bash
sudo bash
apt install git
git clone https://github.com/wali-ku/RTG-Synch.git
```

3. Goto the *kernel* folder in this repository. Enter the *tx2* folder and
   execute the [RUN-ME.sh](./kernel/tx2/RUN-ME.sh) script which will fetch the
   kernel source code of L4T from NVIDIA's repositories,
   [patch](./kernel/tx2/misc/rtgsync.patch) it with changes required for
   deploying RTG-Sync, build the kernel on the board and replace the kernel
   image on the board with the updated kernel image

> If you are doing this step manually, please note that the following configuration options must be enabled before building the **patched** kernel: ```CONFIG_SCHED_DEBUG```, ```CONFIG_SCHED_RTGANG```. Moreover, enable ```CONFIG_SCHED_THROTTLE``` to use best-effort task throttling feature and ```CONFIG_SCHED_PALLOC``` to enable page-coloring.

```bash
cd RTG-Synch/kernel/tx2
./RUN-ME.sh
```

4. Reboot the board if everything went correctly in the previous step. Make
   sure that you see ```NO_RT_GANG_LOCK``` in the ```sched_features``` file:

```bash
sudo bash
cat /sys/kernel/debug/sched_features
```

## User-Level Middleware
Once the kernel has been successfully patched with RTG-Sync, the programmer can use the RTG-Sync middleware daemon and user-library calls to use the services provided by our framework.

### Compilation
To compile the user-level framework of RTG-Sync, do the following:

```bash
sudo bash
cd RTG-Synch/src/framework
make
```
This should create a ```build``` folder containing three executables: ```rtg_client, rtg_daemon, librtg.so```

### API Calls
RTG-Sync framework provides two APIs which can be used by linking with our shared library (```librtg.so```).

| API              | Description                                               |
|------------------|-----------------------------------------------------------|
| [rtg_member_setup](https://github.com/wali-ku/RTG-Synch/blob/4753be6da10e6578ac0917dd92845f7e43ae6387/src/framework/lib/rtg_lib.c#L279) | Register as a member tasks of an established virtual gang |
| [rtg_member_sync](https://github.com/wali-ku/RTG-Synch/blob/4753be6da10e6578ac0917dd92845f7e43ae6387/src/framework/lib/rtg_lib.c#L419)  | Synchronize with other member tasks of my virtual gang    |

## Example Usecase
To illustrate how RTG-Sync framework can be used, we consider the following use-case: We need to create a virtual gang out of two periodic real-time tasks (tau_1 and tau_2). The virtual gang can tolerate 100-MB/s interfering memory traffic from best-effort tasks (i.e., throttling budget). We also want to statically partition the LLC between real-time and best-effort tasks with a ratio 3 (real-time) : 1 (best-effort). Finally, we want to partition the real-time LLC partition equally between tau_1 and tau_2. For this purpose, we assume that the target platform has 8 page-colors available for LLC partitioning. Hence, colors 0-5 should be assigned to real-time tasks and colors 6, 7 should be given to best-effort tasks. Among tau_1 and tau_2, tau_1 should get colors 0, 1, 2 and tau_2 should get colors 3, 4, 5.

Assume that the real-time tasks have the following template source-code:
```C
#include <...>

int main (void)
{
    int var1, var2, ...;
    
    setup_resources (...);
    
    /* Periodic execution starts here */
    while (1) {
         do_something ();
	 wait_till_next_period ();
    }
    
    return;
}
```

The application is compiled using the following command:
```bash
gcc tau_1.c -o tau_1
```

In order to achieve our desired goal in this use-case, we do the following:

1. Create a virtual gang with two member tasks
```bash
sudo bash
cd src/framework/build
./rtg_daemon &
./rtg_client -c 2
```
The last command should print the ID value of the virtual gang if it was created successfully. Let us assume that the ID is **1001**.

2. Modify the source code of tau_1 and tau_2 to register as member tasks of the virtual gang just created and to synchronize with each other before their periodic execution starts:
```C
#include <...>

/* Include RTG-Sync library header to use the APIs */
#include "rtg_lib.h"

int main (void)
{
    int var1, var2, ...;
    
    /* 
     * This variable is used to transform raw page-colors to a color-mask
     * value appropriate for the target platform.
    */
    unsigned long color_mask;
    
    /* Declare pthread barrier variable */
    pthread_barrier_t *barrier;
    
    setup_resources (...);
    
    /* Create color-mask for using page-colors 0,1,2 (3,4,5 for tau_2) */
    color_mask = parse_color_string ("0-2");
    
    /*
     * Register as virtual gang member with the desired parameters:
     *   pthread_barrier_t* rtg_member_setup (int id,
     *                                        unsigned long color_mask,
     *                                        unsigned int mem_read_budget,
     *                                        unsigned int mem_write_budget);
    */
    barrier = rtg_member_setup (1001, color_mask, 100, 100);
    
    /* Synchronize on the barrier before periodic execution begins */
    rtg_member_sync (barrier);
    
    /* Periodic execution starts here */
    while (1) {
         do_something ();
	 wait_till_next_period ();
    }
    
    return;
}
```

To compile the application now, we must specify the include path for RTG-Sync header and we must link with RTG-Sync shared library.
```bash
CFLAGS += -I<RTG-Sync-Repo-Path>/src/framework/include
LDFLAGS += -lrt
LIBS += -lrtg -lpthread

gcc $(CFLAGS) $(LDFLAGS) tau_1.c -o tau_1 $(LIBS)
```

3. Enable kernel level gang-scheduling:
```bash
echo RT_GANG_LOCK > /sys/kernel/debug/sched_features
```

4. Setup page-coloring via PALLOC:
```bash
# Specify color-mask for the target platform
echo 0x0001c000 > /sys/kernel/debug/palloc/color_mask

# Enable PALLOC
echo 1 > /sys/kernel/debug/palloc/use_palloc

# Create static LLC partitions for real-time and best-effort tasks
mkdir /sys/fs/cgroup/palloc/part_rt
mkdir /sys/fs/cgroup/palloc/part_be

echo "0-5" > /sys/fs/cgroup/palloc/part_rt/palloc.bins
echo "6,7" > /sys/fs/cgroup/palloc/part_be/palloc.bins
```

5. Enable best-effort task throttling:
```bash
echo "start 1" > /sys/kernel/debug/throttle/control
```

6. When tau_1 and tau_2 are now executed on different CPU cores in the real-time PALLOC CGROUP, they will run simultaneously and their periodic execution will be aligned.
```bash
echo $$ > /sys/fs/cgroup/palloc/part_rt/tasks
taskset -c 0 chrt -f 5 ./tau_1 ... &
taskset -c 1 chrt -f 5 ./tau_2 ...
```

7. Once both tau_1 and tau_2 have exited, do the following to destroy the virtual gang (1001):
```bash
./rtg_client -f 1001
```

8. To properly kill the rtg_daemon, do the following:
```bash
./rtg_client -t
```

9. To stop best-effort task throttling:
```bash
echo "start 0" > /sys/kernel/debug/throttle/control
```

10. To disable page-coloring and gang-scheduling:
```bash
echo 0 > /sys/kernel/debug/palloc/use_palloc
echo NO_RT_GANG_LOCK > /sys/kernel/debug/sched_features
```

# Sanity Tests
Follow the instructions here to perform simple sanity tests to verify your
installation of RTG-Sync components. Before proceeding with the tests, please
install the following tools which will be used to record / visualize test
results: ```trace-cmd, kernelshark```

```bash
sudo apt install trace-cmd kernelshark
```

## Gang Scheduling via RT-Gang
The goal of RT-Gang is to enforce one-gang-at-a-time scheduling policy on real-time tasks. Under this policy, only one (highest priority) real-time task (unser SCHED_FIFO)---single threaded or parallel---is allowed to execute across all cores of a multicore platform.

### Test
The test to verify RT-Gang comprises the following steps:

- Create two real-time tasks with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 40        | 100         | 1       |
| tau_2 | 20        | 50          | 1       |

- Run the tasks on two disjoint CPU cores of the target platform
- Record a 10-second execution trace
- Repeat the experiment but this time, enable RT-Gang

### Script
The test-case is automated via this [script](./kernel/sanity_tests/rtgang/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/rtgang
make
. test.sh
```

### Expected Outcome
When executed without RT-Gang, the real-time tasks can run simultaneously across different cores. Following is the trace snapshot of this case on Jetson TX-2:

![Execution Trace without RT-Gang](https://github.com/wali-ku/RTG-Synch/blob/master/kernel/sanity_tests/rtgang/example_output/wo_rtgang.png)

With RT-Gang, only the highest-priority real-time task executes at any given time. In this test-case, tau_2 is higher priority (due to shorter period and RMS priority assignment).

![Execution Trace with RT-Gang](https://github.com/wali-ku/RTG-Synch/blob/master/kernel/sanity_tests/rtgang/example_output/with_rtgang.png)

## Virtual Gangs
Virtual gang abstraction allows synchronous co-execution of pre-determined groups of real-time tasks under RT-Gang.

### Test
The test to verify virtual gang scheduling consists of the following steps:

- Create two real-time tasks with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 20        | 50          | 1       |
| tau_2 | 10        | 50          | 1       |

- Enable RT-Gang
- Run the tasks on two disjoint CPU cores of the target platform
- Record a 10-second execution trace
- Repeat the experiment but this time, use RTG-Sync library to create a virtual gang out of the two tasks

### Script
The test-case is automated via this [script](./kernel/sanity_tests/virtual_gang/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/virtual_gang
make
. test.sh
```

### Expected Outcome
When executed without creating virtual gang first, the real-time tasks execute one-at-a-time due to RT-Gang. Following is the trace snapshot of this case on Jetson TX-2:

![Execution Trace without Virtual Gang](https://github.com/wali-ku/RTG-Synch/blob/master/kernel/sanity_tests/virtual_gang/example_output/wo_vgang.png)

When virtual gang is created, both tau_1 and tau_2 can execute simultaneously. Moreover, their periodic execution is perfectly aligned.

![Execution Trace with Virtual Gang](https://github.com/wali-ku/RTG-Synch/blob/master/kernel/sanity_tests/virtual_gang/example_output/with_vgang.png)

## Page-Coloring via PALLOC
The goal of PALLOC is to allow partitioning of LLC between best-effort tasks and real-time tasks and between member real-time tasks of a virtual gang.

### Test
We use bandwidth benchmark from IsolBench suite as our real-time task. The benchmark accesses a linear chunk of memory of specific size and prints the page-colors associated with that memory chunk once the execution is complete. The test to verify page-coloring under RTG-Sync framework proceeds as follows:

- Setup PALLOC to enforce 1/4th (best-effort) and 3/4th (real-time) static partitioning of LLC via CGROUPS
- Register bandwidth as a virtual gang and make it use 1/2 of the real-time LLC partition
- Execute bandwidth for 10-seconds and examine the page-colors printed by it after the execution completes

### Script
The test-case is automated via this [script](./kernel/sanity_tests/palloc/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/palloc
make
. test.sh
```

### Expected Outcome
If the target platform has N page-colors available for LLC partitioning, bandwidth benchmark should use 3\*N / 8 of those page-colors. On Jetson TX-2, there are 8 page-colors in total, so bandwidth is allowed to use 3 of those colors as per the setup of this experiment ([output.txt](./kernel/sanity_tests/palloc/example_output/output.txt)):

```
===========================================================
	 Color Number 	 : 	      Pages 	 Size (MB)
===========================================================
	    ### 	 : 	       4453       17
	 Color[00] 	 : 	       1439        5
	 Color[01] 	 : 	       1418        5
	 Color[02] 	 : 	       1379        5
	 Color[03] 	 : 	         49        0
	 Color[04] 	 : 	         60        0
	 Color[05] 	 : 	         48        0
	 Color[06] 	 : 	         23        0
	 Color[07] 	 : 	         37        0

```

## Throttling of Best-Effort Tasks
Throttling framework can be used to limit the memory usage budgets of co-executing best-effort tasks while a virtual gang is running.

### Test
To verify throttling of best-effort tasks under RTG-Sync, we do the following:

- Create a single real-time task with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 30        | 50          | 1       |

- Run the task as a virtual gang with a best-effort throttling budget of 100-MB/s (reads)
- Spawn a memory intensive best-effort task on a different CPU core
- Collect execution trace for 10-seconds

### Script
The test-case is automated via this [script](./kernel/sanity_tests/throttling/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/throttling
make
. test.sh
```

### Expected Outcome
The best-effort task should get throttled whenever its execution overlaps with the execution of tau_1. On Jetson TX-2, the resulting execution timeline looks like this:

![Execution Trace with Throttling of BE Tasks](https://github.com/wali-ku/RTG-Synch/blob/master/kernel/sanity_tests/throttling/example_output/throttle.png)
