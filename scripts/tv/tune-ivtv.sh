#!/bin/bash
# 
# Small script to switch channels and dump the 
# current channel playing to a text file to be
# used in another script, to display what is on
# using a TV Guide.
####################
#
# Check for ivtv-tune - a tool from ivtv-utils
# that helps to tune in channels.
if [[ -z $( type -p ivtv-tune ) ]]; then 
      echo -e "ivtv-utils -- NOT INSTALLED !";exit
  fi
#
CHAN="$1"
if [ -z "$CHAN" ]; then
      echo "Please Insert a Channel Number to Tune"
  else
        unset response
TUNECHAN="ivtv-tune -c ${CHAN}"
#
$TUNECHAN
      echo "Switching to Channel: $CHAN"
      echo -e "Channel:$CHAN" > ~/.ivtv/ivtv-channel
fi

