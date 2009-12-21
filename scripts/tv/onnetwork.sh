#!/bin/bash
#
# script to fetch network that tuner is on
######
#
CHAN=$(cat $HOME/.ivtv/ivtv-channel | cut -f2 -d ":")
NETWORK=$(cat $HOME/.ivtv/networks|grep "$CHAN" | cut -f2 -d ":" | head -1)
echo -e "$NETWORK"
