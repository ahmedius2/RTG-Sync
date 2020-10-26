# Test case to verify virtual gang scheduling
#
# Description:
#   Virtual gangs allow static grouping of different real-time tasks into a
#   single scheduling entity that is scheduled under the one-gang-at-a-time
#   policy of our kernel level gang scheduler. To verify virtual gang
#   scheduling, we do the following:
#   1. Create two real-time tasks with the following parameters:
#      t1: (C = 20, T = 50, h = 1)
#      t2: (C = 10, T = 50, h = 1) => high priority
#   2. Execute the tasks on different CPU cores in two schemes. In
#      "without_vgang" scheme, enable RT-Gang but do not form virtual gang. In
#      "with_vgang", create a virtual gang with two members and make t1 and t2
#      the member tasks of the virtual gang. Record execution trace of both
#      schemes
#
# Expected Outcome:
#   When virtual gang is used, t1 and t2 can execute simultaneously and their
#   preriods are synchronized. Without virtual gang, t2 preempts t1 whenever
#   their execution overlaps.
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

# This is the number of iterations (-i) of bandwidth-rt, with 16-KB
# working-set, required to have a per-job execution time of ~10-msec on Jetson
# TX-2. Modify this parameter appropriately based on your test platform.
TX2_ITERS_16KB_10MS=8000
RTG_BUILD_PATH="../../../src/framework/build"

if [ ! -f tau_1 ] || [ ! -f tau_2 ]; then
	echo -e "${RED}[ERROR] Please compile the test applications!${NCL}"
	return
fi

# echo -e "${GRN}[STATUS] Recording trace without virtual gang${NCL}"
echo 2 > /sys/kernel/debug/rtgang/debug_level
echo "RT_GANG_LOCK" > /sys/kernel/debug/sched_features
# taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
# trace_pid=$!
# sleep 5
#
# chrt -f 5 ./tau_1 -c 3 -t 10 -m 16 -n 1 --period 50 --jobs 200 \
# 	-i $((TX2_ITERS_16KB_10MS*2)) &> /dev/null &
# chrt -f 6 ./tau_2 -c 4 -t 10 -m 16 -n 1 --period 50 --jobs 200 \
# 	-i ${TX2_ITERS_16KB_10MS} &> /dev/null
#
# sleep 5
# kill -s SIGINT ${trace_pid}
# while [ ! -f "trace.dat" ]; do
# 	sleep 1
# done
# mv trace.dat without_vgang.trace

echo -e "${GRN}[STATUS] Recording trace with virtual gang${NCL}"

taskset -c 2 ${RTG_BUILD_PATH}/rtg_daemon &> /dev/null &
sleep 1
taskset -c 2 ${RTG_BUILD_PATH}/rtg_client -c 2 &> /dev/null

taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!
sleep 5

chrt -f 6 ./tau_3 -c 5 -t 15 -m 16 -n 1 --period 110 --jobs 200 \
	-i ${TX2_ITERS_16KB_10MS} -v 1 & #&> /dev/null
sleep 1

chrt -f 5 ./tau_1 -c 3 -t 10 -m 16 -n 1 --period 100 --jobs 200 \
	-i $((TX2_ITERS_16KB_10MS*2)) -g 1001 -b & #&> /dev/null &
chrt -f 5 ./tau_2 -c 4 -t 10 -m 16 -n 1 --period 100 --jobs 200 \
	-i ${TX2_ITERS_16KB_10MS} -g 1001 #&> /dev/null

kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat with_vgang.trace

${RTG_BUILD_PATH}/rtg_client -f 1001 &> /dev/null
${RTG_BUILD_PATH}/rtg_client -t &> /dev/null
echo "NO_RT_GANG_LOCK" > /sys/kernel/debug/sched_features
echo 0 > /sys/kernel/debug/rtgang/debug_level
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
