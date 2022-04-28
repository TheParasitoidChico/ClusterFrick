#!/bin/bash
echo "running running running"
echo $1
mkdir ./OUTPUT/$1"directory"
Rscript phylotaR_pipe.R $1

