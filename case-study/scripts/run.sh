periods=(50 75 100)

for period_msec in ${periods[@]}; do
	# Collect data with kernelshark trace
	echo "[STATUS] Running Experiment 1 / 8: RT-Gang + Trace-Cmd (${period_msec}-msec)"
	. experiments/rtgang.sh ${period_msec} trace-cmd &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 2 / 8: Rand-Gang + Trace-Cmd (${period_msec}-msec)"
	. experiments/grand.sh ${period_msec} trace-cmd &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 3 / 8: NoSync-Gang + Trace-Cmd (${period_msec}-msec)"
	. experiments/nosync.sh ${period_msec} trace-cmd &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 4 / 8: RTG-Synch + Trace-Cmd (${period_msec}-msec)"
	. experiments/rtgsynch.sh ${period_msec} trace-cmd &> run.log
	echo "---------------------------"  &> run.log
	sleep 5

	# Collect data with ftrace
	echo "[STATUS] Running Experiment 5 / 8: RT-Gang + Ftrace (${period_msec}-msec)"
	. experiments/rtgang.sh ${period_msec} &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 6 / 8: Rand-Gang + Ftrace (${period_msec}-msec)"
	. experiments/grand.sh ${period_msec} &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 7 / 8: NoSync-Gang + Ftrace (${period_msec}-msec)"
	. experiments/nosync.sh ${period_msec} &> run.log
	echo "---------------------------"  &> run.log
	sleep 2

	echo "[STATUS] Running Experiment 8 / 8: RTG-Synch + Ftrace (${period_msec}-msec)"
	. experiments/rtgsynch.sh ${period_msec} &> run.log
	echo "---------------------------"  &> run.log
	sleep 5
done
