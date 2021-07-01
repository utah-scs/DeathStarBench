#!/bin/sh

./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output1 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output2 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output3 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output4 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output5 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output6 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output7 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output8 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output9 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output10 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output11 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output12 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output13 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output14 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output15 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/sched_bench_10ms.lua http://10.0.1.1:11211/sched_bench/run_10ms -R 2 > output16 &
