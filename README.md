# RTG-Sync: Virtual Gang based Scheduling of Parallel Real-Time Tasks
RTG-Sync is a scheduling framework which enables static grouping of real-time
tasks into singular schedulable entities, called virtual gangs, which are
executed one-at-a-time on all cores of a multicore platform. The **goal** of
RTG-Sync is to enable completely deterministic scheduling of real-time tasks on
COTS multicore platforms while preserving high system utilization in the
presence of shared hardware resource interference.

This repository contains the code and instructions for deploying RTG-Sync in a
Linux based system.

# Setup
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

## Sanity Tests
Follow the instructions here to perform simple sanity tests to verify your
installation of RTG-Sync components. Before proceeding with the tests, please
install the following tools which will be used to record / visualize test
results: ```trace-cmd, kernelshark```

```bash
sudo apt install trace-cmd kernelshark
```

### Gang Scheduling via RT-Gang
**Goal**: Enforce one-gang-at-a-time scheduling policy on real-time tasks

Under this policy, only one (highest priority) real-time task (unser SCHED_FIFO)---single threaded or parallel---is allowed to execute across all cores of a multicore platform.

**Test**: The test to verify RT-Gang comprises the following steps:

- Create two real-time tasks with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 40        | 100         | 1       |
| tau_2 | 20        | 50          | 1       |

- Run the tasks on two disjoint CPU cores of the target platform
- Record a 10-second execution trace
- Repeat the experiment but this time, enable RT-Gang

**Script**: The test-case is automated via this [script](./kernel/sanity_tests/rtgang/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/rtgang
make
. test.sh
```

**Expected Outcome**: When executed without RT-Gang, the real-time tasks can run simultaneously across different cores. Following is the trace snapshot of this case on Jetson TX-2:

![Execution Trace without RT-Gang](https://github.com/wali-ku/RTG-Synch/blob/kernel/kernel/sanity_tests/rtgang/example_output/wo_rtgang.png)

With RT-Gang, only the highest-priority real-time task executes at any given time. In this test-case, tau_2 is higher priority (due to shorter period and RMS priority assignment).

![Execution Trace with RT-Gang](https://github.com/wali-ku/RTG-Synch/blob/kernel/kernel/sanity_tests/rtgang/example_output/with_rtgang.png)

---
### Virtual Gangs
**Goal**: Allow synchronous co-execution of pre-determined groups of real-time tasks under RT-Gang

Virtual gangs allow static grouping of different real-time tasks for co-execution under one-gang-at-a-time scheduling policy. They also align the periodic execution of member real-time tasks via synchronization barriers.

**Test**: The test to verify virtual gang scheduling consists of the following steps:

- Create two real-time tasks with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 30        | 50          | 1       |
| tau_2 | 20        | 50          | 1       |

- Enable RT-Gang
- Run the tasks on two disjoint CPU cores of the target platform
- Record a 10-second execution trace
- Repeat the experiment but this time, use RTG-Sync library to create a virtual gang out of the two tasks

**Script**: The test-case is automated via this [script](./kernel/sanity_tests/virtual_gang/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/virtual_gang
make
. test.sh
```

**Expected Outcome**: When executed without creating virtual gang first, the real-time tasks execute one-at-a-time due to RT-Gang. Following is the trace snapshot of this case on Jetson TX-2:

![Execution Trace without Virtual Gang](https://github.com/wali-ku/RTG-Synch/blob/kernel/kernel/sanity_tests/virtual_gang/example_output/wo_vgang.png)

When virtual gang is created, both tau_1 and tau_2 can execute simultaneously. Moreover, their periodic execution is perfectly aligned.

![Execution Trace with Virtual Gang](https://github.com/wali-ku/RTG-Synch/blob/kernel/kernel/sanity_tests/virtual_gang/example_output/with_vgang.png)

---
### Page-Coloring via PALLOC
**Goal**: Allow partitioning of LLC between best-effort tasks and real-time tasks and between member real-time tasks of a virtual gang

**Test**: We use bandwidth benchmark from IsolBench suite as our real-time task. The benchmark accesses a linear chunk of memory of specific size and prints the page-colors associated with that memory chunk once the execution is complete. The test to verify page-coloring under RTG-Sync framework proceeds as follows:

- Setup PALLOC to enforce 1/4th (best-effort) and 3/4th (real-time) static partitioning of LLC via CGROUPS
- Register bandwidth as a virtual gang and make it use 1/2 of the real-time LLC partition
- Execute bandwidth for 10-seconds and examine the page-colors printed by it after the execution completes

**Script**: The test-case is automated via this [script](./kernel/sanity_tests/palloc/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/palloc
make
. test.sh
```

**Expected Outcome**: If the target platform has N page-colors available for LLC partitioning, bandwidth benchmark should use 3\*N / 8 of those page-colors. On Jetson TX-2, there are 8 page-colors in total, so bandwidth is allowed to use 3 of those colors as per the setup of this experiment ([output.txt](./kernel/sanity_tests/palloc/example_output/output.txt)):

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

---
### Throttling of Best-Effort Tasks
**Goal**: Limit the memory usage budgets of co-executing best-effort tasks while a virtual gang is running

**Test**: To verify throttling of best-effort tasks under RTG-Sync, we do the following:

- Create a single real-time task with the following parameters:

| Task  | WCET (ms) | Period (ms) | Threads |
|-------|-----------|-------------|---------|
| tau_1 | 30        | 50          | 1       |

- Run the task as a virtual gang with a best-effort throttling budget of 100-MB/s (reads)
- Spawn a memory intensive best-effort task on a different CPU core
- Collect execution trace for 10-seconds

**Script**: The test-case is automated via this [script](./kernel/sanity_tests/throttling/test.sh). To run the script, do the following:

```bash
sudo bash
cd <RTG-Sync-Repo-Path>/kernel/sanity_tests/throttling
make
. test.sh
```

**Expected Outcome**: The best-effort task should get throttled whenever its execution overlaps with the execution of tau_1. On Jetson TX-2, the resulting execution timeline looks like this:

![Execution Trace with Throttling of BE Tasks](https://github.com/wali-ku/RTG-Synch/blob/kernel/kernel/sanity_tests/throttling/example_output/throttle.png)
