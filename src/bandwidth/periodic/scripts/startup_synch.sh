# Declare the experiment parameters for real-timet taskset
tracing_core=1
period_usec=500
compute_usec=200
fifo_priority=5
verbose_level=0
num_of_jobs=10000
num_of_threads=1
access_type="read"
num_of_rt_tasks=4
virtual_gang_id=1001
working_set_size_kb=16
task_numbers=(1 2 3 4)
cpu_affinities=(0 3 4 5)
max_exec_time_sec=$((${num_of_jobs}*${period_usec}*2/1000))

# Declare parameters for best-effort corunners
be_access_type="read"
be_working_set_size_kb=16384
bw_exec="/home/nvidia/ssd/gits/BWLOCK-GPU/benchmarks/IsolBench/bench/bandwidth"
rtg_sync_dir="/home/nvidia/ssd/gits/RT-Gang/experiments/tx2/sync/src/framework/build"

# Create virtual-gang with desired members via RTG-Synch
taskset -c ${tracing_core} ${rtg_sync_dir}/rtg_daemon &
taskset -c $((${tracing_core}+1)) ${rtg_sync_dir}/rtg_client -c ${num_of_rt_tasks}

# Start tracing on denver core
if [ "$1" == "trace-cmd" ]; then
	taskset -c ${tracing_core} trace-cmd record -e sched_switch &> /dev/null &
	trace_pid=$!
else
	echo > /sys/kernel/debug/tracing/trace
fi

sleep 2

# Spawn the tasks
for task_id in `seq 0 $((${num_of_rt_tasks}-1))`; do
	task_number=${task_numbers[${task_id}]}
	affinity=${cpu_affinities[${task_id}]}
	task_name="tau_rt_${task_number}"

	# Execute best-effort corunners first
	${bw_exec} \
		-m ${be_working_set_size_kb} \
		-t ${max_exec_time_sec} \
		-a ${be_access_type} \
		-c ${affinity} &> /dev/null &

	# Execute the real-time task
	chrt -f ${fifo_priority} ./${task_name} \
		-m ${working_set_size_kb} \
		-t ${max_exec_time_sec} \
		-v ${virtual_gang_id} \
		-n ${num_of_threads} \
		-s ${verbose_level} \
		-e ${compute_usec} \
		-a ${access_type} \
		-l ${period_usec} \
		-j ${num_of_jobs} \
		-c ${affinity} \
		-x &

	last_task=$!
done

# Wait for real-time tasks to finish; then clean-up
wait ${last_task} &> /dev/null
killall bandwidth &> /dev/null
${rtg_sync_dir}/rtg_client -f ${virtual_gang_id}
${rtg_sync_dir}/rtg_client -t

# Rename the trace file
if [ "$1" == "trace-cmd" ]; then
	kill -s SIGINT ${trace_pid} &> /dev/null
	sleep 2
	mv trace.dat trace.startup_sync
else
	cp /sys/kernel/debug/tracing/trace ktrace.startup_sync
	echo > /sys/kernel/debug/tracing/trace
fi
