#!/bin/bash

# Define command-line arguments

NAMESPACE=$3
RESOURCE_TYPE=$2

# Retrieve resource usage statistics from Kubernetes
kubectl $1 $RESOURCE_TYPE -n $NAMESPACE | tail -n +2 | while read  line
do
  # Extract CPU and memory usage from the output
  NAME=$(echo $line | awk '{print $1}')
  CPU=$(echo $line | awk '{print $2}')
  MEMORY=$(echo $line | awk '{print $3}')

  echo "Resource # Namespace # Name # CPU # Memory" | column -t -s '#'
  echo "$RESOURCE_TYPE # $NAMESPACE # $NAME # $CPU # $MEMORY" | column -t -s '#'
done