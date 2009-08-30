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

NPM=$(ps ax | grep mplayer | cut -c55-100)
#
if [ "$NPM" == "/dev/video0" ];then echo "On MPlayer: Watching TV aka.. [IdiotBox]"
else
expr substr "On MPlayer: $NPM " 1 200
fi
