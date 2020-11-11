# NOTE: Invoke as "sudo bash max_perf.sh" or your shell may exit unexpectedly
#
# Can be used as-is on Xavier. Can potentially be used on TX-2 as well but
# the GPU node address below must be updated accordingly
sysfs_cpu_node="/sys/devices/system/cpu"
sysfs_gpu_node="/sys/devices/gpu.0/devfreq/17000000.gv11b"
proc_rtthrottle_node="/proc/sys/kernel/sched_rt_runtime_us"

source functions.sh
check_root

for cpu in ${sysfs_cpu_node}/cpu?; do
	max_cpu_freq=`cat ${cpu}/cpufreq/cpuinfo_max_freq`

	# Turn on all the CPU cores
	set_node_value ${cpu}/online 1

	# Maximize cpu frequency and disable scaling
	set_node_value ${cpu}/cpufreq/scaling_governor performance
	set_node_value ${cpu}/cpufreq/scaling_max_freq ${max_cpu_freq}
	set_node_value ${cpu}/cpufreq/scaling_min_freq ${max_cpu_freq}

	# Disable deep sleep states
	for sstate in ${cpu}/cpuidle/state?; do
		set_node_value ${sstate}/disable 1
	done
done

# Maximize GPU clock rate and disable scaling
max_gpu_freq=`cat ${sysfs_gpu_node}/available_frequencies | grep -Eo '[0-9]+$'`
set_node_value ${sysfs_gpu_node}/governor performance
set_node_value ${sysfs_gpu_node}/max_freq ${max_gpu_freq}
set_node_value ${sysfs_gpu_node}/min_freq ${max_gpu_freq}

# Disable RT throttling
set_node_value ${proc_rtthrottle_node} -1
