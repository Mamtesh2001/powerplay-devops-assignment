#!/bin/bash

echo "=========================================="
echo "System Report - $(date)"
echo "=========================================="

echo "Date & Time    : $(date)"
echo "Uptime         : $(uptime -p)"

# CPU usage (User + System)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage      : ${CPU}%"

# Memory usage
MEMORY=$(free | awk '/Mem/ {printf("%.2f%%", $3/$2 * 100)}')
echo "Memory Usage   : $MEMORY"

# Disk usage
DISK=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Usage     : $DISK"

echo "Top 3 CPU Processes:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -4 | tail -3

echo ""
