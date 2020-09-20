tt=('light' 'mixed' 'heavy')
ep=(0 25)

for tasktype in ${tt[@]}; do
	for edgeprob in ${ep[@]}; do
		echo "> Plotting Taskset Type = ${tasktype} EP = ${edgeprob}"
		./simulator.py ${tasktype} 1000 ${edgeprob} r
	done
done
