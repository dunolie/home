#!/bin/sh
UPTIME=$(uptime | cut -f 2 -d "p" | cut -f 1 -d ",")
echo "Uptime:$UPTIME"
