# Test case to verify page-coloring via PALLOC
#
# Description:
#   PALLOC allows partitioning of LLC via OS level page-coloring. Using PALLOC,
#   programmer can isolate real-time tasks and best-efforts into separate LLC
#   partitions. Moreover, the real-time partition can be further divided among
#   member tasks of a virtual gang. To verify PALLOC, we do the following:
#   1. Specify page-coloring mask for the platform
#   2. Create static LLC partitions via CGROUP between real-time and
#      best-effort tasks
#   3. Spawn (modified) bandwidth benchmark as a real-time task and add it to
#      real-time PALLOC CGROUP. Make bandwidth use 1/2 of the real-time LLC
#      partition via RTG-Sync library call
#
# Expected Outcome:
#   The modified bandwidth benchmark will print the distribution of its
#   working-set into page-colors. Based on the setup parameters (page-coloring
#   mask (step-1), real-time partition in terms of page-colors (step-2) and the
#   colors that bandwidth was allowed to use (step-3)), the benchmark should
#   have used a subset of total available colors
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

# This is the page-coloring mask for partitioning LLC on Jetson TX-2 board.
# Please modify it appropriately if the target platform is different.
PALLOC_MASK="0x1c000"
PALLOC_RT_BINS="0-5"
BW_VGANG_BINS="0,1,2"
PALLOC_DEBUGFS_PATH=/sys/kernel/debug/palloc
PALLOC_CGROUP_PATH=/sys/fs/cgroup/palloc
PALLOC_CGROUP_RT=${PALLOC_CGROUP_PATH}/part_rt
RTG_BUILD_PATH=../../../src/framework/build

if [ ! -f bandwidth ]; then
	echo -e "${RED}[ERROR] Please compile the test application!${NCL}"
	return
fi

# Setup PALLOC
echo -e "${GRN}[STATUS] Executing real-time task with page-coloring${NCL}"
echo ${PALLOC_MASK} > ${PALLOC_DEBUGFS_PATH}/palloc_mask
[ -d ${PALLOC_CGROUP_RT} ] || mkdir ${PALLOC_CGROUP_RT}
echo ${PALLOC_RT_BINS} > ${PALLOC_CGROUP_RT}/palloc.bins
echo "flush" > ${PALLOC_DEBUGFS_PATH}/control
echo 1 > ${PALLOC_DEBUGFS_PATH}/use_palloc

chrt -f 5 ./bandwidth -c 0 -t 5 -m 16384 -l ${BW_VGANG_BINS} &> output.txt &
echo $! > ${PALLOC_CGROUP_RT}/tasks
wait $!

# Disable PALLOC
echo "flush" > ${PALLOC_DEBUGFS_PATH}/control
echo 0 > ${PALLOC_DEBUGFS_PATH}/use_palloc
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
