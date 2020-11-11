source ../functions.sh

check_root
check_executables tau_1 tau_2 tau_3

echo -e "${G}[STATUS] Recording trace with RT-Gang w/o virtual gangs${N}"
rtgang_enable 1
start_tracing 7 &
sleep 5

chrt -f 5 ./tau_1 -a 0 -n 2 -c 4 -p 10 -j 100 &> /dev/null &
tau_1=$!

chrt -f 6 ./tau_2 -a 2 -n 1 -c 3 -p 10 -j 100 &> /dev/null &
chrt -f 7 ./tau_3 -a 3 -n 1 -c 2 -p 10 -j 100 &> /dev/null &

wait ${tau_1}
sleep 1
stop_tracing
mv trace.dat without_vgang.trace

echo -e "${G}[STATUS] Recording trace with RT-Gang and virtual gangs${N}"
start_vgang_daemon 7 &
sleep 1

create_vgang 3
start_tracing 7 &
sleep 5

chrt -f 5 ./tau_1 -a 0 -n 2 -c 4 -p 10 -j 100 -v 1001 &> /dev/null &
chrt -f 6 ./tau_2 -a 2 -n 1 -c 3 -p 10 -j 100 -v 1001 &> /dev/null &
chrt -f 7 ./tau_3 -a 3 -n 1 -c 2 -p 10 -j 100 -v 1001 &> /dev/null

sleep 1
stop_tracing
destroy_vgang 1001
stop_vgang_daemon
mv trace.dat with_vgang.trace

rtgang_enable 0
echo -e "${GRN}[STATUS] Experiment Complete!${NCL}"
