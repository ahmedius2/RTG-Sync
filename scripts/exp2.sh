# [FOLLOWING FROM EXP-1] Understand the impact of kernel tracing on the
# synchronization of two applications which are launched simultaneously. This
# is done by launching the trace-cmd (on a different core then the ones used by
# applications under test) much earlier than launching the test applications.

trace-cmd record -e sched_switch tau_be_cpu -c 5 -t 1000 -m 16 &
sleep 5

# By now, tracing should have setup its events and should be in steady-state on
# its assigned core. Start the target applications
chrt -f 5 tau_2 -c 4 -m 256 -i 1000 --jobs 100 --period 50 &
chrt -f 5 tau_1 -c 3 -m 256 -i 1500 --jobs 100 --period 50

killall tau_be_cpu
sleep 2
mv trace.dat tr_exp2.dat
