#!/bin/bash  
# Small script to echo 
# Stop | Pause | and What MOC is playing Artist - Song CT/TT
# Variables
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`
CT=`mocp -i | grep 'CurrentTime' | awk '{print $2}'`
TT=`mocp -i | grep 'TotalTime' | awk '{print $2}'`

if [ "$INFO" == "State: STOP" ];then echo -n "MOC[]"
elif [ "$STATE" == "State: PAUSE" ];then echo -n "MOC||"
else 
expr substr "$ARTIST - $TITLE $CT/$TT " 1 200

fi
