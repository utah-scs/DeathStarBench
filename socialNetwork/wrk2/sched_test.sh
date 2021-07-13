#!/bin/sh

./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output1 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output2 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output3 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output4 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output5 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output6 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output7 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output8 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output9 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output10 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output11 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output12 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output13 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output14 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output15 &
sleep 0.05
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 20 > output16 &
sleep 0.05



./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_100ms.lua http://10.0.1.1:11211/sched_bench/run_100ms -R 4 &
sleep 0.1
