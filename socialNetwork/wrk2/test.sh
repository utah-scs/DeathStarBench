#!/bin/sh

./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output1 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output2 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output3 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output4 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output5 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output6 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output7 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.1:11211/microbenchmark/func -R 1 > output8 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output9 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output10 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output11 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output12 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output13 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output14 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output15 &
sleep 0.1
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark2.lua http://10.0.1.1:11211/microbenchmark2/func -R 1 > output16 
