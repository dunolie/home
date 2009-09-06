#!/bin/bash
# Site Grab
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
WGET="/usr/bin/wget"
SAVE="$HOME/dev/wget/sites"
cd $SAVE
WEBURL=$1
if [ -z "$WEBURL" ];then
    echo " Please Provide a URL Link.. (Example: http://dicksonfilm.com) "
else
    unset response
$WGET --random-wait -r -p -e robots=off -U mozilla $1
fi
