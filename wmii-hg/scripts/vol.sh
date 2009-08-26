#!/bin/bash
status=$(amixer sget 'PCM' | tail -n 1)
vol=$(echo ${status} | gawk '{print $5}' | tr -d [])
state=$(echo ${status} | gawk '{print $5}')    

if [ $state == "[0%]" ]; then
    text="muted"
else
    text="${vol}"
fi
echo ${text}
