#!/bin/bash
# Site Grab
VER="0.1"
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# Version
echo ""
echo "Site Grab V. $VER"
echo ""
echo ""
# Check WGet
if [[ -z $( type -p wget ) ]]; then 
      echo -e "wget -- NOT INSTALLED !";exit
fi
WHEREISWGET=$(whereis wget | awk '{print $2}')
WGET="$WHEREISWGET"
# Check for Site Grab's Working Directory
LSGETDIR=$(ls $HOME/dev/wget | grep "sites")
if [ "$LSGETDIR" != "sites" ];then
     mkdir -p "$HOME/dev/wget/sites"
     echo " Grabbing Site ..." 
else 
     echo " Grabbing Site ..."
SAVE="$HOME/dev/wget/sites"
cd $SAVE
WEBURL=$1
if [ -z "$WEBURL" ];then
    echo " Please Provide a URL Link.. (Example: http://dicksonfilm.com) "
else
    unset response
$WGET --random-wait -r -p -e robots=off -U mozilla $1
fi
fi

