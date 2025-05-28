#!/bin/bash
# Find zombie processes on a Linux system
echo "Listing zombie processes..."
ps aux | awk '{ if ($8 == "Z") print $0; }'
