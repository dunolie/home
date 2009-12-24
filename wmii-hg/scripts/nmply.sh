#!/bin/sh
# Now Playing On Mplayer
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
## 
# [READ NEXT TWO LINES]
##
# alias in bashrc
# alias mplayer='mplayer -ao alsa -vf pp=lb'
#############################################
# Colors
# regular colors
K='\E[0;30m' # Black - Regular
R='\E[0;31m' # Red
G='\E[0;32m' # Green
Y='\E[0;93m' # Yellow
B='\E[0;34m' # Blue
P='\E[0;35m' # Purple
C='\E[0;36m' # Cyan
W='\E[0;37m' # White
O='\E[0;33m' # Orange
BK='\E[1;30m' # Black - Bold
BR='\E[1;31m' # Red
BG='\E[1;32m' # Green
BY='\E[1;93m' # Yellow
BB='\E[1;34m' # Blue
BP='\E[1;35m' # Purple
BC='\E[1;36m' # Cyan
BW='\E[1;37m' # White
BO='\E[1;33m' # Orange
UK='\E[4;30m' # Black - Underline
UR='\E[4;31m' # Red
UG='\E[4;32m' # Green
UW='\E[4;93m' # Yellow
UB='\E[4;34m' # Blue
UP='\E[4;35m' # Purple
UC='\E[4;36m' # Cyan
UW='\E[4;37m' # White
UO='\E[4;33m' # Orange
BGK='\E[40m'   # Black - Background
BGR='\E[41m'   # Red
BGG='\E[42m'   # Green
BGY='\E[93m'   # Yellow
BGB='\E[44m'   # Blue
BGP='\E[45m'   # Purple
BGC='\E[46m'   # Cyan
BGW='\E[47m'   # White
BGO='\E[33m'   # Orange
TR='\E[0m'    # Text Reset
NPM=$(ps ax | grep mplayer | cut -c35-80 | head -1 | sed 's/\(.*\)\..*/\1/')
#
if [ "$NPM" == "" ];then echo -e "${W}On MPlayer${K}: ${BW}Player Empty.. ${R}[${BW}Nothing Playing${R}]"
else
if [ "$NPM" == "/dev/video0" ];then echo -e "${W}On MPlayer${K}: ${BW}Watching TV aka.. ${R}[${BW}IdiotBox${R}]"
else
echo -e "${W}On MPlayer${K}: ${BW}$NPM "
fi
fi
