#!/bin/bash

set -e
set -v

rm -rf build
mkdir build
cd build
cmake ..
cmake --build . -- VERBOSE=1
cd ../tests
python run_tests.py
