# Test case to verify throttling of best-effort tasks
#
# Description:
#   The throttling framework allows regulation of memory traffic from
#   best-effort tasks while a real-time task is executing. The regulation
#   threshold is specified by the real-time task. To verify this feature, we do
#   the following:
#   1. Spawn a real-time task with the following parameters:
#      t1: (C = 10, T = 20, h = 1)
#      - Specify a regulation budget of 10 MB/s (reads).
#   2. Create a best-effort tasks on a disjoint CPU core
#   3. Collect execution trace of the experiment
#
# Expected Outcome:
#   Whenever the execution of real-time task overlaps with that of best-effort
#   task, the latter should get throttled.
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

# This is the number of iterations (-i) of bandwidth-rt, with 16-KB
# working-set, required to have a per-job execution time of ~10-msec on Jetson
# TX-2. Modify this parameter appropriately based on your test platform.
TX2_ITERS_16KB_10MS=8000
RTG_BUILD_PATH=../../../src/framework/build
THROTTLE_DEBUGFS_PATH=/sys/kernel/debug/throttle

if [ "${USER}" != "root" ]; then
	echo -e "${RED}[ERROR] Please run this script as root!${NCL}"
fi


if [ ! -f tau_1 ] || [ ! -f tau_be_rd ]; then
	echo -e "${RED}[ERROR] Please compile the test applications!${NCL}"
	return
fi

echo -e "${GRN}[STATUS] Recording trace with throttling${NCL}"
echo "RT_GANG_LOCK" > /sys/kernel/debug/sched_features
echo "start 1" > ${THROTTLE_DEBUGFS_PATH}/control
taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!
sleep 5

chrt -f 5 ./tau_1 -c 3 -t 10 -m 16 -n 1 --period 20 --jobs 500 \
	-i ${TX2_ITERS_16KB_10MS} -w 100 &> /dev/null &
tau1_pid=$!

sleep 1
./tau_be_rd -c 4 -m 16384 -t 8 &> output_be_rd.txt &

wait ${tau1_pid}
kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat with_throttling.trace

echo "start 0" > ${THROTTLE_DEBUGFS_PATH}/control
echo "NO_RT_GANG_LOCK" > /sys/kernel/debug/sched_features
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
