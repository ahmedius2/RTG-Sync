source ../functions.sh

check_root
check_executables tau_1 tau_2

echo -e "${G}[STATUS] Recording trace without RT-Gang${N}"
rtgang_enable 0
start_tracing 7 &
sleep 5

chrt -f 5 ./tau_1 -a 0 -n 2 -c 10 -p 50 -j 100 &
tau_1=$!

chrt -f 6 ./tau_2 -a 2 -n 2 -c 10 -p 43 -j 100 &

wait ${tau_1}
stop_tracing
mv trace.dat without_rtgang.trace

echo -e "${G}[STATUS] Recording trace with RT-Gang${N}"
rtgang_enable 1
start_tracing 7 &
sleep 5

chrt -f 5 ./tau_1 -a 0 -n 2 -c 10 -p 50 -j 100 &
tau_1=$!

chrt -f 6 ./tau_2 -a 2 -n 2 -c 10 -p 43 -j 100 &

wait ${tau_1}
stop_tracing
mv trace.dat with_rtgang.trace

rtgang_enable 0
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
