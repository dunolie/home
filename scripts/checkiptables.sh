#!/bin/bash
# IPTables if UP.

IFUP=$(ls /var/run/daemons | grep "iptables")
if [ "$IFUP" != "iptables" ];then
    echo "IPTables Down - You're UnProtected"
else
    echo "IPTables Running - You're Protected"
fi


