#!/bin/bash
# system-info.sh - Displays system memory, CPU, disk, and load information

echo "======================================"
echo "  System Information Report"
echo "Generated on: $(date)"
echo "======================================"
echo ""

# Hostname and uptime
echo "Hostname: $(hostname)"
echo "Uptime:"
uptime
echo ""

# Memory usage
echo "Memory Usage:"
free -h
echo ""

# Swap usage
echo "Swap Usage:"
swapon --show || echo "No swap enabled"
echo ""

# CPU Info
echo "CPU Info:"
lscpu | grep -E 'Model name|Socket|Thread|Core|MHz|Architecture'
echo ""

# Top 5 memory-consuming processes
echo "Top 5 Memory-Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

# Disk usage
echo "Disk Usage:"
df -h | grep -v tmpfs
echo ""

# Load average
echo "Load Average (1, 5, 15 mins):"
cat /proc/loadavg
echo ""

echo "Report Complete"

