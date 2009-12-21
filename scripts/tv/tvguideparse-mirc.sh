#!/bin/bash
#
# Parse and retrieve TV Info from http://tvlistings.aol.com - Time Warner Standard
#  limited to santa ana - atm.
#############################
# Colors
# Forground
W='\x0300' # White
K='\x0301' # Black
B='\x0302' # Blue (Navy)
G='\x0303' # Green
R='\x0304' # Red
BN='\x0305' # Brown (Maroon)
P='\x0306' # Purple
O='\x0307' # Orange
Y='\x0308' # Yellow
LG='\x0309' # Lt. Green
T='\x0310' # Teal
LC='\x0311' # Lt. Cyan
LB='\x0312' # Lt. Blue
PN='\x0313' # Pink
GY='\x0314' # Grey
LGY='\x0315' # Lt. Grey
# Background
BW=',00' # Background White
BK=',01' # Background Black
BB=',02' # Background Blue
BG=',03' # Background Green
BR=',04' # Background Red
BBN=',05' # Background Brown (Maroon)
BP=',06' # Background Purple
BO=',07' # Background Orange
BY=',08' # Background Yellow
BLG=',09' # Background Lt. Green
BT=',10' # Background Teal
BLC=',11' # Background Lt. Cyan
BLC=',12' # Background Lt. Blue
BPN=',13' # Background Pink
BGY=',14' # Background Grey
BLGY=',15' # Background Lt. Grey
# Various
BLD='\x02' # Bold
UL='\x1f' # Underlined
FL='\x06' # Flashing
RT='\x03\x02\x02' # Reset Text
# Variables
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
echo -e "${BN}M${LGY}Player${O}TV${RT}: ${LG}$X ${O}- ${LB}$ONTV"

