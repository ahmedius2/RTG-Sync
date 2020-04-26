# Test case to verify gang-scheduling of RT-Gang
#
# Description:
#   RT-Gang allows real-time tasks to be scheduled one-at-a-time across all
#   cores of a multicore platform. To verify that RT-Gang is working, we do the
#   following:
#   1. Create two real-time tasks with the following parameters:
#      t1: (C = 40, T = 100, h = 1)
#      t2: (C = 20, T = 50,  h = 1) => high-priority
#   2. Execute the tasks on different CPU cores with trace-cmd for some time
#   3. Analyze the trace files from execution
#
# Expected Outcome:
#   Under RT-Gang, t2 should preempt t1 across the core whenever their
#   execution overlap.
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

# This is the number of iterations (-i) of bandwidth-rt, with 16-KB
# working-set, required to have a per-job execution time of ~10-msec on Jetson
# TX-2. Modify this parameter appropriately based on your test platform.
TX2_ITERS_16KB_10MS=8000

if [ ! -f tau_1 ] || [ ! -f tau_2 ]; then
	echo -e "${RED}[ERROR] Please compile the test applications!${NCL}"
	return
fi

echo -e "${GRN}[STATUS] Recording trace without RT-Gang${NCL}"
echo "NO_RT_GANG_LOCK" > /sys/kernel/debug/sched_features
taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!
sleep 5

chrt -f 5 ./tau_1 -c 3 -t 10 -m 16 -n 1 --period 100 --jobs 100 \
	-i $((TX2_ITERS_16KB_10MS*4)) &> /dev/null &
chrt -f 6 ./tau_2 -c 4 -t 10 -m 16 -n 1 --period 50  --jobs 200 \
	-i $((TX2_ITERS_16KB_10MS*2)) &> /dev/null

kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat without_rtgang.trace

echo -e "${GRN}[STATUS] Recording trace with RT-Gang${NCL}"
echo "RT_GANG_LOCK" > /sys/kernel/debug/sched_features
taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!
sleep 5

chrt -f 5 ./tau_1 -c 3 -t 10 -m 16 -n 1 --period 100 --jobs 100 \
	-i $((TX2_ITERS_16KB_10MS*4)) &> /dev/null &
chrt -f 6 ./tau_2 -c 4 -t 10 -m 16 -n 1 --period 50  --jobs 200 \
	-i $((TX2_ITERS_16KB_10MS*2)) &> /dev/null

kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat with_rtgang.trace
echo "NO_RT_GANG_LOCK" > /sys/kernel/debug/sched_features
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
