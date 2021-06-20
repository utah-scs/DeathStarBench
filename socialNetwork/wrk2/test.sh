#!/bin/sh

./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output1 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output2 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output3 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output4 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output5 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output6 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output7 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output8 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output9 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output10 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output11 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output12 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output13 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output14 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output15 &
./wrk -t 1 -c 1 -d 100 -L -s ./scripts/microbenchmark.lua http://10.0.1.3:11211/microbenchmark/func -R 1 > output16 
