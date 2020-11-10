R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

root="`pwd`"
rtgsync_dir=${root}/../../../src/framework/build

check_root () {
	if [ "`whoami`" != 'root' ]; then
		echo -e "${R}[ERROR] Must be root!${N}"
		exit
	fi
}

set_node_value () {
	local node=${1}
	local new_value=${2}
	local time_passed=0

	# Wait for this many seconds to allow the node to update its value;
	# before calling it quits
	local timeout=5

	echo ${new_value} > ${node}
	until [ "`cat ${node}`" == "${new_value}" ]; do
		if [ ${time_passed} -gt ${timeout} ]; then
			echo -e "${R}[ERROR] Unable to set node <${node}> to value <${new_value}>${N}"
			exit
		fi

		sleep 1
		let time_passed+=1
	done
}

check_executables () {
	for exe in $@; do
		if [ ! -f ${exe} ]; then
			echo -e "${R}[ERROR] Required executable <${exe}> not found!${N}"
			exit
		fi
	done
}

rtgang_enable () {
	local enable=${1}
	local sched_feats_file="/sys/kernel/debug/sched_features"

	case ${enable} in
		0)
			echo "NO_RT_GANG_LOCK" > ${sched_feats_file}
			;;
		1)
			echo "RT_GANG_LOCK" > ${sched_feats_file}
			;;
		*)
			echo -e "${R}[ERROR] Invalid value <${enable}> for RT-Gang lock!${N}"
			;;
	esac
}

start_tracing () {
	local core=${1}

	taskset -c ${core} trace-cmd record -e "sched_switch" &> /dev/null
}

stop_tracing () {
	local trace_pid=`pgrep trace-cmd`

	kill -s SIGINT ${trace_pid} &> /dev/null
	while [ ! -f "trace.dat" ]; do
		sleep 1
	done
}

start_vgang_daemon () {
	local core=${1}

	if [ ! -d ${rtgsync_dir} ]; then
		echo -e "${R}[ERROR] RTG-Sync userspace executables not found!${N}"
		exit
	fi

	taskset -c ${core} ${rtgsync_dir}/rtg_daemon &> /dev/null
}

stop_vgang_daemon () {
	${rtgsync_dir}/rtg_client -t &> /dev/null

	if [ "$?" != "0" ]; then
		echo -e "${R}[ERROR] Unable to terminate RTG-Sync daemon!${N}"
		exit
	fi
}

create_vgang () {
	local num_of_members=${1}

	${rtgsync_dir}/rtg_client -c ${num_of_members} &> /dev/null

	if [ "$?" != "0" ]; then
		echo -e "${R}[ERROR] Unable to create virtual-gangs!${N}"
		exit
	fi
}

destroy_vgang () {
	local gang_id=${1}

	${rtgsync_dir}/rtg_client -f ${gang_id} &> /dev/null

	if [ "$?" != "0" ]; then
		echo -e "${R}[ERROR] Unable to destroy virtual-gang <${gang_id}>!${N}"
		exit
	fi
}
