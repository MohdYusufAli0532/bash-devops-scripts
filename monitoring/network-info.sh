#!/bin/bash
# network-info.sh - Displays key network configuration and status

echo "======================================"
echo "Network Information Report"
echo "Generated on: $(date)"
echo "======================================"
echo ""

# Hostname and IP Address
echo "Hostname: $(hostname)"
echo "IP Addresses:"
hostname -I
echo ""

# Network Interfaces
echo "Network Interfaces:"
ip -brief address show
echo ""

# Default Gateway
echo "Default Gateway:"
ip route | grep default
echo ""

# DNS Servers
echo "DNS Servers:"
cat /etc/resolv.conf | grep -E '^nameserver' || echo "No DNS servers configured"
echo ""

# Active Internet Connections
echo "Active Internet Connections:"
ss -tuln
echo ""

# Top 5 Listening Services
echo "Top 5 Listening Services (by port):"
ss -tuln | grep LISTEN | head -n 5
echo ""

echo "Network report complete"

