#!/bin/bash

read -p "Threshold for CPU in %: " tc

idle=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}')
cpu_used=$(echo "100 - $idle" | bc)
if (( $(echo "$cpu_used > $tc" | bc -l) )); then
    notify-send "Alert" "CPU usage is high: $cpu_used%"
fi
read -p "Threshold for Memory in %: " tm
total=$(top -bn1 | grep "MiB Mem" | awk -F'[ :,]+' '{print $3}')
used=$(top -bn1 | grep "MiB Mem" | awk -F'[ :,]+' '{print $7}')
mem_used=$(echo "($used / $total) * 100" | bc -l)
if (( $(echo "$mem_used > $tm" | bc -l) )); then
    notify-send "Alert" "Memory usage is high: $mem_used%"
fi


read -p "Threshold for Disk space in %: " td
disk_used=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}' )
if (( disk_used > td )); then
    notify-send "Alert" "Disk usage is high: $disk_used%"
fi

