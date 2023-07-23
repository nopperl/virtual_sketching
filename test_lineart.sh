#!/bin/sh
filename=$1
mkdir -p ./outputs/runtime/
time -o ./outputs/runtime/"${filename%png}txt" python test_vectorization.py --input "$filename"
