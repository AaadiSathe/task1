#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Assign start and end indices
start_index=$1
end_index=$2

# Generate inputFile with index and random numbers
> inputFile  # Clear the file if it already exists
for ((i=start_index; i<=end_index; i++)); do
    echo "$i, $((RANDOM % 1000))" >> inputFile
done

