# RTG-Synch: Virtual Gang Management Framework for RT-Gang
This is a supplementary repository for [RT-Gang](https://github.com/CSL-KU/RT-Gang). It contains the framework designed to support the **virtual gang** concept introduced in RT-Gang.

## What is a virtual gang?
Under RT-Gang framework, a virtual gang is a group of processes which are allowed to execute simultaneously on different cores of a multicore platform. The membership of a virtual gang is decided by the programmer; provided that all members of a single virtual gang obey the following restrictions:
  - must have the same period
  - must not contend for the same set of CPU cores
  - must have the same real-time scheduler

## Why virtual gang abstraction is needed?
The strict gang scheduling policy (i.e., one-gang-at-a-time) of RT-Gang runs the risk of under-utilizing the multicore platform; in case of imperfectly parallelized applications which cannot fully utilize all the CPU cores. With virtual gang abstraction, a programmer can improve system utilization by designating other application(s) to run alongside a given application. Since the membership of virtual gang is pre-determined, the intra-gang interference effects can be accurately analyzed; giving a realistic real-time system.

## Challenges
Following challenges are involved in creating the virtual gang abstraction:
  - How to mark different processes as part of one virtual gang?
> For real-gangs (i.e., threads belonging to a single process), the RT-Gang framework uses the ```tgid``` value in the Linux task data-structure to ascertain gang membership. A different criterion is needed for virtual gangs; for obvious reasons.

  - How to synchronize between members of virtual gang?
> Synchronization between threads of (real) gangs is managed by the applications themselves under RT-Gang. Among virtual gang members, no inherent synchronization is present. A trivial solution is to start different processes which form a virtual gang at the same time in a script. However, this leads to poor results because of non-deterministic process creation delays on different cores. Moreover, this solution does not provide *job-level synchronization* between virtual gang members. If left unmanaged, the members of virtual gang can get completely out-of-phase with each other.

## Virtual Gang Management Framework
This brings us to the framework designed to address the challenges involved in providing the virtual gang abstraction. This framework consists of three components:
  - [Daemon](src/framework/manager/daemon)
  - [Client](src/framework/manager/client)
  - [Shared Library](src/framework/lib)
  
Each of these components are described in detail below.
