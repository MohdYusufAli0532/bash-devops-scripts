#!/bin/bash
# disk-health.sh - Checks disk usage and SMART health info

echo "======================================"
echo "Disk Health & Usage Report"
echo "Generated on: $(date)"
echo "======================================"
echo ""

# Disk usage
echo "Mounted Filesystem Usage:"
df -h --output=source,size,used,avail,pcent,target | grep -v tmpfs
echo ""

# Inode usage
echo "Inode Usage:"
df -hi | grep -v tmpfs
echo ""

# Check for SMART tools
if command -v smartctl &> /dev/null; then
    echo "SMART Disk Health:"
    for disk in /dev/sd[a-z]; do
        echo "Checking $disk"
        sudo smartctl -H $disk | grep "SMART overall-health"
        echo ""
    done
else
    echo "SMART tools (smartmontools) not installed. Skipping health check."
    echo "To enable disk health checks, install with: sudo apt install smartmontools"
    echo ""
fi

echo "Disk Health Check Complete"

