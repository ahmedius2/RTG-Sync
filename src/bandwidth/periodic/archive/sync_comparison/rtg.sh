tau_be_mem -c 5 -t 100 -m 16384 -a write &
tau_be_cpu -c 0 -t 100 -m 16 &

trace-cmd record -e sched_switch chrt -f 5 ./tau_1 -o -c 1 -n 2 -m 500 --period 30 --jobs 1000 -i 500 -v 1001 &
chrt -f 5 ./tau_2 -o -c 3 -n 2 -m 500 --period 30 --jobs 1000 -i 250  -v 1001

killall tau_be_mem
killall tau_be_cpu
