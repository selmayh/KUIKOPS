#!/bin/bash

# [TODO] Verification of the number of arguments

# Retrieving arguments :
## name : name of the repo to create,
## N : number of empty files to create,
## prefix : the prefix to put at the start of the file's name,
## M : time between each creation of file.

if [ "$#" -ne 4 ]; then
  echo "Please enter 4 arguments following this : $0 <name> <N> <prefix> <M>"
  exit 1
fi

repo_name=repo_$1
N=$2
prefix=$3
M=$4

# Creating the repository
mkdir -p $repo_name

# Loop of N to create N files
for ((i=0;i<N;i++)) do

# Date with format : year-month-day-hour-minute-second-millisecond
now=$(date +%Y-%m-%d-%H-%M-%S-$(date +%2N))

# Creating the empty file
touch $repo_name"/"$prefix"_"$now".txt"

# Sleeping M milliseconds

waiting_time=$(awk "BEGIN {print $M / 1000}")
sleep $waiting_time

done

echo $N" file(s) created succeffully."
exit
