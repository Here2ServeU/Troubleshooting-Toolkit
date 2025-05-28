#!/bin/bash
# Check disk usage and alert if above 80%

THRESHOLD=80
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
  usep=$(echo $output | awk '{ print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{ print $2 }')
  if [ $usep -ge $THRESHOLD ]; then
    echo "Warning: Disk usage above ${THRESHOLD}% on partition $partition"
  fi
done
