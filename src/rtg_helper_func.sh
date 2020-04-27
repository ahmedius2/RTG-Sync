#!/bin/bash

pDebugfs=/sys/kernel/debug
pPalloc=${pDebugfs}/palloc
pRtgang=${pDebugfs}/rtgang
pThrottle=${pDebugfs}/throttle
pPallocCg=/sys/fs/cgroup/palloc

#
# Show the status of real-time kernel extensions comprising RTG-Sync framework
#
rt_dashboard () {
	blt_l1="o"
	blt_l2="  *"
	blt_l3="    -"
	blt_l4="      >"

	palloc_state=`cat ${pPalloc}/use_palloc`
	palloc_parts=`ls ${pPallocCg} | grep "part*"`
	bwlock_state=`cat ${pThrottle}/control | grep "Inactive"`
	rtgang_state=`cat ${pDebugfs}/sched_features | grep NO_RT_GANG_LOCK`
	bwlock_rd_events=`cat ${pThrottle}/control | grep 0x17 | sed 's/.*| //'`
	bwlock_wr_events=`cat ${pThrottle}/control | grep 0x18 | sed 's/.*| //'`

	echo "==================== RTG-Sync System State"
	echo "${blt_l1} RT-Gang"
	printf "${blt_l2} Enabled     : ";
	[ "${rtgang_state}" == "" ] && echo "Yes" || echo "No"
	printf "${blt_l2} Debug Level : "; cat ${pDebugfs}/rtgang/debug_level

	echo
	echo "${blt_l1} BWLOCK"
	printf "${blt_l2} Enabled     : ";
	[ "${bwlock_state}" == "" ] && echo "Yes" || echo "No"
	printf "${blt_l2} Debug Level : ";
	cat ${pThrottle}/control | grep "Debug Level" | sed 's/.*: //'
	printf "${blt_l2} Read Quota  : %d MB/s\n" \
		$((${bwlock_rd_events}*64*1000/1024/1024))
	printf "${blt_l2} Write Quota : %d MB/s\n" \
		$((${bwlock_wr_events}*64*1000/1024/1024))

	echo
	echo "${blt_l1} PALLOC"
	printf "${blt_l2} Enabled     : ";
	[ "${palloc_state}" != "0" ] && echo "Yes" || echo "No"
	printf "${blt_l2} Debug Level : "; cat ${pDebugfs}/palloc/debug_level
	printf "${blt_l2} Color Mask  : 0x%x\n" \
		`cat ${pDebugfs}/palloc/palloc_mask`
	printf "${blt_l2} Partitions  : ";
	[ "${palloc_parts}" == "" ] && echo "None" || echo ${palloc_parts}

	if [ "${palloc_parts}" != "" ]; then
		for p in ${palloc_parts[@]}; do
			echo "${blt_l3} $p"
			printf "${blt_l4} Bins    : %s\n" \
				`cat /sys/fs/cgroup/palloc/$p/palloc.bins`
			printf "${blt_l4} Tasks   : "; \
				echo `cat /sys/fs/cgroup/palloc/$p/tasks`
		done
	fi
}

#
# Perform one time steps to setup RTG-Sync components
#
rt_setup () {
	partitions=("part_rt" 	"part_be")
	bins=(	    "0-5" 	"6,7")
	palloc_mask="0x0001c000"

	if [ "${USER}" != "root" ]; then
		echo "Must be root!"
		return
	fi

	echo ${palloc_mask} > ${pPalloc}/palloc_mask
	for n in `seq 0 $((${#partitions[@]}-1))`; do
		partition_name=${partitions[$n]}
		partition_bins=${bins[$n]}

		mkdir -p ${pPallocCg}/${partition_name}
		echo ${partition_bins} > \
			${pPallocCg}/${partition_name}/palloc.bins
	done
}

#
# Enable all the components of RTG-Sync
#
rt_enable () {
	if [ "${USER}" != "root" ]; then
		echo "Must be root!"
		return
	fi

	echo 1 > ${pPalloc}/use_palloc
	echo "start 1" > ${pThrottle}/control
	echo RT_GANG_LOCK > ${pDebugfs}/sched_features
}

#
# Disable all the components of RTG-Sync
#
rt_disable () {
	if [ "${USER}" != "root" ]; then
		echo "Must be root!"
		return
	fi

	echo 0 > ${pPalloc}/use_palloc
	echo "flush" > ${pPalloc}/control
	echo "start 0" > ${pThrottle}/control
	echo NO_RT_GANG_LOCK > ${pDebugfs}/sched_features
}

#
# Enable debugging of RTG-Sync components
#
rt_debug () {
	rtgang_debug_lvl=$1
	palloc_debug_lvl=$2
	throttle_debug_lvl=$3

	[ ${rtgang_debug_lvl} != "" ] && \
		echo ${rtgang_debug_lvl} > ${pRtgang}/debug_level
	[ ${palloc_debug_lvl} != "" ] && \
		echo ${palloc_debug_lvl} > ${pPalloc}/debug_level
	[ ${throttle_debug_lvl} != "" ] && \
		echo "debug ${throttle_debug_lvl}" > ${pThrottle}/control
}

#
# Assign all the future tasks in this shell to real-time cgroup of RTG-Sync
#
rt_shell () {
	if [ "${USER}" != "root" ]; then
		echo "Must be root!"
		return
	fi

	[ -d ${pPallocCg}/part_rt ] && echo $$ > ${pPallocCg}/part_rt/tasks || \
		echo "Real-Time palloc partition not present!"
}

#
# Assign all the future tasks in this shell to best-effort cgroup of RTG-Sync
#
be_shell () {
	[ -d ${pPallocCg}/part_be ] && echo $$ > ${pPallocCg}/part_be/tasks || \
		echo "Best-Effort palloc partition not present!"
}
