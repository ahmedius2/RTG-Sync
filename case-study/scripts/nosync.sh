#############################################################################
# Experiment Script: Need for Synchronization
#
# This experiment scenario highlights the need of synchronization among gang
# members by show-casing the sub-optimal performance of optimally formed gangs
# when synchronizatina is not enforced among members.
#
# Copyright (C) 2019 KU-CSL
#############################################################################

tracing_core=1
num_of_tasks=4
period_msec=$1
dnn_gang_id=1001
num_of_frames=945
dnn_gang_priority=6
be_read_threshold_mbps=10
be_write_threshold_mbps=5
model_files=("m1.pb"    "m2.pb"     "m3.pb"      "m4.pb" )
input_files=("v1.avi"   "v2.avi"    "v3.avi"     "v4.avi")
cpu_affinities=(0          3           4            5    )
output_control=(""      ""          ""           ""      )

bw_rt_gang_id=1002
bw_rt_verbose_lvl=0
bw_rt_num_of_jobs=${num_of_frames}
bw_rt_gang_priority=5
bw_rt_num_of_threads=1
bw_rt_period_usec=$((${period_msec}*1000))
bw_rt_access_type="write"
bw_rt_compute_time_usec=20000
bw_rt_working_set_size_kb=16384
bw_rt_max_exec_time_msec=$((${bw_rt_num_of_jobs}*${bw_rt_period_usec}*2/1000000))
bw_rt_path="/home/nvidia/ssd/gits/RT-Gang/experiments/tx2/sync/src/bandwidth/periodic"
rtg_sync_path="/home/nvidia/ssd/gits/RT-Gang/experiments/tx2/sync/src/framework/build"

echo "============= Starting Experiment..."
if [ "$2" == "trace-cmd" ]; then
	# Start tracing on denver cluster
	taskset -c ${tracing_core} trace-cmd record -e sched_switch &> /dev/null &
	trace_pid=$!
else
	echo 16384 > /sys/kernel/debug/tracing/buffer_size_kb
	echo > /sys/kernel/debug/tracing/trace
	echo 1 > /sys/kernel/debug/rtgang/debug_level
fi

sleep 2

###############################################################################
# Gang - 1 (4 DNN)
###############################################################################
taskset -c 0 chrt -f ${dnn_gang_priority} ./deepPicar \
		-w ${be_write_threshold_mbps} \
		-r ${be_read_threshold_mbps} \
		-l ${num_of_frames} \
		-x ${dnn_gang_id} \
		-t ${period_msec} \
		-i inputs/v1.avi \
		-m models/m1.pb \
		-g 2> /dev/null &


for task_id in `seq 1 $((${num_of_tasks}-1))`; do
	output=${output_control[${task_id}]}
	affinity=${cpu_affinities[${task_id}]}
	model=models/${model_files[${task_id}]}
	input=inputs/${input_files[${task_id}]}

	taskset -c ${affinity} chrt -f ${dnn_gang_priority} ./deepPicar \
			-w ${be_write_threshold_mbps} \
			-r ${be_read_threshold_mbps} \
			-i ${input} ${output} \
			-l ${num_of_frames} \
			-x ${dnn_gang_id} \
			-m ${model} \
			-t ${period_msec} 2> /dev/null &

	last_task=$!
done

sleep 1

###############################################################################
# Gang - 2 (4 BwWrite-RT)
###############################################################################
taskset -c 0 chrt -f ${bw_rt_gang_priority} ${bw_rt_path}/tau_rt_1 \
		-m ${bw_rt_working_set_size_kb} \
		-t ${bw_rt_max_exec_time_msec} \
		-e ${bw_rt_compute_time_usec} \
		-n ${bw_rt_num_of_threads} \
		-l ${bw_rt_period_usec} \
		-a ${bw_rt_access_type} \
		-s ${bw_rt_verbose_lvl} \
		-j ${bw_rt_num_of_jobs} \
		-w ${bw_rt_gang_id} \
		-c 0 -g &> /dev/null &

for task_id in `seq 1 $((${num_of_tasks}-1))`; do
	affinity=${cpu_affinities[${task_id}]}
	bw_rt_exec="${bw_rt_path}/tau_rt_$((${task_id}+1))"

	taskset -c ${affinity} chrt -f ${bw_rt_gang_priority} ${bw_rt_exec} \
			-m ${bw_rt_working_set_size_kb} \
			-t ${bw_rt_max_exec_time_msec} \
			-e ${bw_rt_compute_time_usec} \
			-n ${bw_rt_num_of_threads} \
			-l ${bw_rt_period_usec} \
			-a ${bw_rt_access_type} \
			-s ${bw_rt_verbose_lvl} \
			-j ${bw_rt_num_of_jobs} \
			-w ${bw_rt_gang_id} \
			-c ${affinity} &> /dev/null &
done

wait ${last_task}

if [ "$2" == "trace-cmd" ]; then
	kill -s SIGINT ${trace_pid} $> /dev/null
	sleep 2

	# Rename trace file
	mv trace.dat trace.nosync_${1}
else
	sleep 2
	cp /sys/kernel/debug/tracing/trace ktrace.nosync_${1}
	echo > /sys/kernel/debug/tracing/trace
fi

echo "============== Experiment Complete!"
