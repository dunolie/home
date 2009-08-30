#!/bin/sh
# Check - Start MCore Script - Conky
#
# Variables
PROCESS="$(ps aux | grep 'conky -c /home/mredd/.conkyrcore' | grep -v grep|wc -l)"
#
if [ "$PROCESS" == "1" ];then
      echo "MCore Conky CheckOnline"
else
      conky -c ~/.conkyrcore > ~/.conkywmii &
fi
