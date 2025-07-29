#!/bin/bash
# process-inspector.sh - A script to inspect system processes by CPU and memory usage

echo "========================================"
echo "Process Inspector"
echo "Generated on: $(date)"
echo "========================================"
echo ""

# Total running processes
echo "Total Running Processes: $(ps -e --no-headers | wc -l)"
echo ""

# Top 10 CPU-consuming processes
echo "Top 10 CPU-Consuming Processes:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 11
echo ""

# Top 10 Memory-consuming processes
echo "Top 10 Memory-Consuming Processes:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 11
echo ""

# Optional: Process type breakdown (bash, ssh, python, java)
echo "🔹 Sample Process Type Count:"
echo -n "Bash: "; ps aux | grep -c '[b]ash'
echo -n "Python: "; ps aux | grep -c '[p]ython'
echo -n "Java: "; ps aux | grep -c '[j]ava'
echo -n "SSH: "; ps aux | grep -c '[s]sh'
echo ""

# Optional: Ask user to search a process by name
read -p "Enter process name to search (or press enter to skip): " pname
if [[ ! -z "$pname" ]]; then
    echo ""
    echo "Searching for processes containing: $pname"
    ps aux | grep "$pname" | grep -v grep
else
    echo "Skipped search."
fi

echo ""
echo "Process inspection complete."

