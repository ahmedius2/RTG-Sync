R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
N='\033[0m'

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
