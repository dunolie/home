#!/bin/bash
#
# Parse and retrieve TV Info from http://tvlistings.aol.com - Time Warner Standard
#  limited to santa ana - atm.
#############################
# Zipcode
ZIPCODE=""
# Cable Providor ID
LINEUPID=""
TVLISTING="http://affiliate.zap2it.com/tvlistings/ZCGrid.do?method=decideFwdForLineup&zipcode=${ZIPCODE}&setMyPreference=false&lineupId=${LINEUPID}:-"
NETWORK=$(sh $HOME/scripts/tv/onnetwork.sh > $HOME/.ivtv/onnetwork)
X=$(cat $HOME/.ivtv/onnetwork)
# elinks:        http://elinks.or.cz/
# check
if [[ -z $( type -p elinks ) ]]; then 
      echo -e "elinks | http://elinks.or.cz -- NOT INSTALLED !";exit
  fi
FETCHGUIDE="elinks -dump -dump-width 300 "$TVLISTING""
#
$FETCHGUIDE > $HOME/.ivtv/TVGUIDE
#
ONNOW=$(cat $HOME/.ivtv/TVGUIDE | grep $X | awk '{$1=""; $2=""; print $0}' | sed 's/\(\ \)\1//' | cut -f2 -d "[" | cut -f2 -d "]" > $HOME/.ivtv/ONNOW)
$ONNOW
ONTV=$(cat $HOME/.ivtv/ONNOW)
echo -e "MPlayerTV: $X - $ONTV"
