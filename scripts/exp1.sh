# The purpose of this experiment is to understand the extent of synchronization
# problem when two applications are executed simultaneously in a shell without
# doing anything special to synchronize them.

chrt -f 5 tau_2 -c 4 -m 256 -i 1000 --jobs 100 --period 50 &
trace-cmd record -e sched_switch chrt -f 5 tau_1 -c 3 -m 256 -i 1500 --jobs 100 --period 50

mv trace.dat tr_exp1.dat
