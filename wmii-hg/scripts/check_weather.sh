#!/bin/sh
CHECKWEATHER=$($HOME/.wmii-hg/scripts/weather.sh ***** | cut -f 1 -d ",")
echo "Weather: $CHECKWEATHER"
