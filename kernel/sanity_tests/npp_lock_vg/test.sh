###############################################################################
# Test case to verify virtual gang scheduling
###############################################################################
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

RTG_BUILD_PATH="../../../src/framework/build"

if [ ! -f tau_1 ] || [ ! -f tau_2 ]; then
	echo -e "${RED}[ERROR] Please compile the test applications!${NCL}"
	return
fi

echo -e "${GRN}[STATUS] Recording trace with virtual gang${NCL}"
echo 2 > /sys/kernel/debug/rtgang/debug_level
echo "RT_GANG_LOCK" > /sys/kernel/debug/sched_features
taskset -c 2 ${RTG_BUILD_PATH}/rtg_daemon &> /dev/null &
sleep 1
taskset -c 2 ${RTG_BUILD_PATH}/rtg_client -c 2 &> /dev/null
taskset -c 2 ${RTG_BUILD_PATH}/rtg_client -c 2 &> /dev/null

taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!

sleep 1
chrt -f 5 taskset -c 3 ./tau_1 -c 5 -p 10 -j 100 -v 1001 &> /dev/null &
chrt -f 5 taskset -c 4 ./tau_1 -c 5 -p 10 -j 100 -v 1001 &> /dev/null &
chrt -f 6 taskset -c 4 ./tau_2 -c 1 -p 9  -j 100 -v 1002 &> /dev/null &
chrt -f 6 taskset -c 5 ./tau_2 -c 1 -p 9  -j 100 -v 1002 &> /dev/null
sleep 2

kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat without_npp.trace
${RTG_BUILD_PATH}/rtg_client -f 1001 &> /dev/null
${RTG_BUILD_PATH}/rtg_client -f 1002 &> /dev/null

echo -e "${GRN}[STATUS] Recording trace with virtual gang (NPP)${NCL}"
sleep 1
taskset -c 2 ${RTG_BUILD_PATH}/rtg_client -c 2 &> /dev/null
taskset -c 2 ${RTG_BUILD_PATH}/rtg_client -c 2 &> /dev/null

taskset -c 1 trace-cmd record -e "sched_switch" &> /dev/null &
trace_pid=$!

sleep 1
chrt -f 5 taskset -c 3 ./tau_1 -c 5 -p 10 -j 100 -v 1003 -y 1 -l 3 &> /dev/null &
chrt -f 5 taskset -c 4 ./tau_1 -c 5 -p 10 -j 100 -v 1003 &> /dev/null &
chrt -f 6 taskset -c 4 ./tau_2 -c 1 -p 9  -j 100 -v 1004 &> /dev/null &
chrt -f 6 taskset -c 5 ./tau_2 -c 1 -p 9  -j 100 -v 1004 &> /dev/null
sleep 2

kill -s SIGINT ${trace_pid}
while [ ! -f "trace.dat" ]; do
	sleep 1
done
mv trace.dat with_npp.trace

${RTG_BUILD_PATH}/rtg_client -f 1003 &> /dev/null
${RTG_BUILD_PATH}/rtg_client -f 1004 &> /dev/null
${RTG_BUILD_PATH}/rtg_client -t &> /dev/null
echo "NO_RT_GANG_LOCK" > /sys/kernel/debug/sched_features
echo 0 > /sys/kernel/debug/rtgang/debug_level
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
