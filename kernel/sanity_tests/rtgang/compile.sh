source ../functions.sh

ROOT="`pwd`"
simple_rt_dir=${ROOT}/../../../src/rt_workload_generator

cd ${simple_rt_dir}
if [ ! -f "simple_rt" ]; then
	echo -e "${G}[STATUS] Compiling RT workload generator${N}"
	make

	if [ "$?" != "0" ]; then
		echo -e "${R}[ERROR] Failed to compile RT workload!${N}"
		exit
	fi
fi

cd ${ROOT}
rm -f tau_1 tau_2
ln -s ${simple_rt_dir}/simple_rt ${ROOT}/tau_1
ln -s ${simple_rt_dir}/simple_rt ${ROOT}/tau_2
echo -e "${Y}[STATUS] All done!${N}"
