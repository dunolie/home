#!/bin/bash
#
# Parse and retrieve TV Info from http://tvlistings.aol.com - Time Warner Standard
#  limited to santa ana - atm.
#############################
TVLISTING="http://affiliate.zap2it.com/tvlistings/ZCGrid.do?method=decideFwdForLineup&zipcode=92707&setMyPreference=false&lineupId=CA04977:-"
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
cat $HOME/.ivtv/TVGUIDE | grep $X > $HOME/.ivtv/ONNOW
cat $HOME/.ivtv/ONNOW | sed 's/\[[^]\]*]//g' | sed -e 's/Logo/ /g' | cut -f1 -d "(" > $HOME/.ivtv/on
ONTV=$(cat $HOME/.ivtv/on | sed 's/$X/ /g' | awk '{print $2,$3,$4,$5,$6,$7,$8}')
echo -e "On TV: $X - $ONTV" 
