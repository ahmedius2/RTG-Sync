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
  - **SOftware**: Linux for Tegra r28.2.1 (Kernel v4.4.38)

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

> If you are doing this step manually, please note that the following configuration options must be enabled before building the **patched** kernel: ```CONFIG_SCHED_DEBUG```, ```CONFIG_SCHED_RTGANG```. Moreover, enable ```CONFIG_SCHED_THROTTLE``` to use best-effort task throttling feature and ```CONFIG_SCHED_PALLOC``` to enable page-coloring (further instructions in the next section)

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

### Sanity Tests
Follow the instructions here to perform a simple sanity test to verify your
installation of RTG-Sync components. Before proceeding with the tests, please
install the following tools which will be used to record / visualize test
results: ```trace-cmd, kernelshark```

```bash
apt install trace-cmd kernelshark
```

1. **Gang Scheduling**:
