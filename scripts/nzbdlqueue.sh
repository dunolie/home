#!/bin/bash
# Recursive NZBGet Run
###############
#
## Queue Directory
QUEUE="$HOME/dls/nzb/nzbget/queue/"
# Jump to Queue
cd $QUEUE
for i in *.nzb; do
  if [ -e "$i" ]; then
    file=`basename "$i" .nzb`
    nzbget "$i";rm "$i"
  fi
done
