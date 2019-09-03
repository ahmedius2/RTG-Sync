tracing_core=1
period_msec=10
fifo_priority=5
verbose_level=0
num_of_jobs=500
num_of_threads=1
access_type="read"
num_of_rt_tasks=4
working_set_size_kb=16
task_numbers=(1 2 3 4)
cpu_affinities=(0 3 4 5)
max_exec_time_sec=$((${num_of_jobs}*${period_msec}*2/1000))

be_access_type="read"
be_working_set_size_kb=16384
bw_exec="/home/nvidia/ssd/gits/BWLOCK-GPU/benchmarks/IsolBench/bench/bandwidth"

taskset -c ${tracing_core} trace-cmd record -e sched_switch &> /dev/null &
trace_pid=$!
sleep 1

for task_id in `seq 0 $((${num_of_rt_tasks}-1))`; do
	task_number=${task_numbers[${task_id}]}
	affinity=${cpu_affinities[${task_id}]}
	task_name="tau_rt_${task_number}"
	compute_time=${task_number}

	${bw_exec} \
		-m ${be_working_set_size_kb} \
		-t ${max_exec_time_sec} \
		-a ${be_access_type} \
		-c ${affinity} &> /dev/null &

	chrt -f ${fifo_priority} ./${task_name} \
		-m ${working_set_size_kb} \
		-t ${max_exec_time_sec} \
		-n ${num_of_threads} \
		-s ${verbose_level} \
		-e ${compute_time} \
		-a ${access_type} \
		-l ${period_msec} \
		-j ${num_of_jobs} \
		-c ${affinity} &

	last_task=$!
done

wait ${last_task} &> /dev/null
killall bandwidth &> /dev/null
kill -s SIGINT ${trace_pid} &> /dev/null
sleep 2

mv trace.dat trace.no_sync
