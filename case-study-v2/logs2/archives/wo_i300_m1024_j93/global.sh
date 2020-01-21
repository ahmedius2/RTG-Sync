# Misc. parameters
tracing_core=1
results_folder=case-study/global

# Parameters for the DNN tasks
# Solo WCET of these tasks is ~8.12-msec
dnn_priority=10
num_of_frames=1000
dnn_period_msec=50
num_of_dnn_tasks=2
startup_jitter=0.93
output_control=( ""		""	)
core_assignment=("0,3" 	  	"4,5"	)
model_files=(	 "m1.pb"  	"m2.pb"	)
input_files=(	 "v1.avi" 	"v2.avi")

# Parameters for the Bw-RT task
# Tasks are designed to have a utilization ~50%
verbose_lvl=0
bwt_priority=5
num_of_threads=4
bwt_iterations=300
access_type="read"
working_set_size_kb=1024
num_of_jobs=${num_of_frames}
bwt_period_msec=$((${dnn_period_msec}*2))
rtgang_dir_path="/home/nvidia/ssd/gits/RT-Gang"
max_exec_time_sec=$((${num_of_jobs}*${bwt_period_msec}*2/1000))
bwt_dir_path=${rtgang_dir_path}/experiments/tx2/sync/src/bandwidth/periodic

# Parameters for the best-effort tasks from the Parboil benchmark suite
# These tasks are supposed to run perpetually in the background - fully
# utilizing any slack left on the CPU cores
num_of_be_tasks=2
be_num_of_threads=2
be_benchmarks=(		"lbm" 		"cutcp"	  )
be_core_assignment=(	"0,3"		"4,5"	  )
be_datasets=(		"long"		"large"	  )
be_run_type=(		"omp_cpu"	"omp_base")
parboil_dir_path="/home/nvidia/ssd/gits/BWLOCK-GPU/benchmarks/parboil"

echo "============= Starting Experiment..."
# Start tracing on the denver cluster
taskset -c ${tracing_core} trace-cmd record -e sched_switch &> /dev/null &
trace_pid=$!

# Start best-effort tasks in the background
pushd . &> /dev/null
cd ${parboil_dir_path}
for bId in `seq 0 $((${num_of_be_tasks}-1))`; do
	run=${be_run_type[${bId}]}
	dataset=${be_datasets[${bId}]}
	benchmark=${be_benchmarks[${bId}]}
	affinity=${be_core_assignment[${bId}]}

	OMP_NUM_THREADS=${be_num_of_threads} taskset -c ${affinity} ./parboil \
		run ${benchmark} ${run} ${dataset} &> /dev/null &
done

# Allow best-effort tasks to settle in
popd &> /dev/null
sleep 1

# Spawn Bw-RT tasks
chrt -f ${bwt_priority} ${bwt_dir_path}/tau_rt_1 \
	-m ${working_set_size_kb} \
	-t ${max_exec_time_sec} \
	-l ${bwt_period_msec} \
	-i ${bwt_iterations} \
	-n ${num_of_threads} \
	-a ${access_type} \
	-s ${verbose_lvl} \
	-j ${num_of_jobs} \
	-c 0 &> /dev/null &

# Let Bw-RT to execute for 1-sec
sleep 1

# Spawn DNN tasks
for tId in `seq 0 $((${num_of_dnn_tasks}-1))`; do
	input=inputs/${input_files[${tId}]}
	model=models/${model_files[${tId}]}
	output=${output_control[${tId}]}
	affinity=${core_assignment[${tId}]}

	taskset -c ${affinity} chrt -f ${dnn_priority} ./deepPicar \
		-t ${dnn_period_msec} \
		-i ${input} ${output} \
		-l ${num_of_frames} \
		-m ${model} 2> /dev/null &

	sleep ${startup_jitter}
done

wait $!

# Stop the background best-effort tasks
for benchmark in ${be_benchmarks[@]}; do
	killall ${benchmark} &> /devnull
done

# Cleanly exit tracing to get recorded data
kill -s SIGINT ${trace_pid} &> /dev/null
killall tau_rt_1
sleep 5

# Discard previous data if exists and move new data from this experiment to a
# dedicated folder
rm -rf ${results_folder}
mkdir -p ${results_folder}
mv run__* ${results_folder}
mv trace.dat ${results_folder}

echo "============== Experiment Complete!"
