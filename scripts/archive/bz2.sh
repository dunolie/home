#!/bin/bash
#
# simple tar script for veek!
#  script allows user to deceide file name 
#   for .tar.bz2 an /path/to/what/to/archieve
#
# add tarit.sh like this
# cd /to/bz2.sh # the run command
# chmod +x bz2.sh; mkdir -p ~/scripts/tar; mv tarit.sh ~/scripts/tar; 
# 
# the create an alias in ~/.bashrc
# vim ~/.bashrc
# 
#
# alias bz2='~/scripts/tar/bz2.sh'
# [press esc]
# :x # to save an quit, then restart your terminal
#
# type   bz2
# follow prompt
#
# Script By: MreDD
#  tueGroup
# http://m-redd.com
#
########################
#
clear
# date variable
#
date | awk '{print $1 $2 $3 $4}' > /tmp/ddate
DATE="$(cat /tmp/ddate)"
# Command alias
BZ2="tar -cjf"
#
##############################################
#file to tar alias
##############################################
TITLE="NameMe"

echo "                                   "
echo "    By Default Creates File        "
echo "     By name of NameMe           "
echo "    Change for Your Needs          " 
echo "                                   "
echo "   Simply Enter Y an hit Return    "
echo "  then name your File to be tard   "
echo "                                   "

echo "Change Title Default Option? : (Press y/n)  "
read TCHANGE

case $TCHANGE in
	y|yes)
	  echo "Name The Archive: "
	   	read TITLE ;;
	n|no)
		echo ;;
	*)
	echo "Bad Entry Sorry"
	exit 1 ;;
    esac 

##############################################
#
##############################################
# path to save
##############################################
SAVE="$HOME/backups/tard"

echo "                                   "
echo "  By Default Creates Directory     "
echo "  inside home/backups/tar/date     "
echo "    Change for Your Needs          " 
echo "                                   "
echo "   Simply Enter Y an hit Return    "
echo "       then name your Directory    "
echo "                                   "

echo "Change Save Default Option? : (Press y/n)  "
read DCHANGE

case $DCHANGE in
	y|yes)
	  echo "Name The Directory: "
	   	read SAVE ;;
	n|no)
		echo ;;
	*)
	echo "Bad Entry Sorry"
	exit 1 ;;
    esac    

##############################################

##############################################
echo "                                   "
echo "  There is no Dfault Here Add      "
echo "  Your Path... and No Bitching     "
echo "    I Repeat Add Your Path         " 
echo "                                   "
echo "   Simply Enter Y an hit Return    "
echo "       then name your Directory    "
echo "                                   "
echo "    something like                 "
echo "       /media/files/need2bkup      "
echo ""
echo "You Must Add Path to What You want Archived : (Press y/n)  "
read CHANGE

case $CHANGE in
	y|yes)
	  echo "Add a Path to what you want Archived: "
	   	read ARCH ;;
	n|no)
		echo ;;
	*)
	echo "Bad Entry Sorry"
	exit 1 ;;
    esac    

##############################################
#
#
# Below list your choices
#
echo " Archive by Date: $DATE "
echo ""
echo "Path to be Archived: $ARCH "
echo ""
echo "Archive File Name: $TITLE "
echo ""
echo "Path for Stored Archive: $SAVE "
echo ""

#
# create directory top save archive by date
#

echo ""
#
# running tar command
#
echo " Running Archive - Give Me Time to Finish "
echo "    Do Not Close Me I am Working          "
$BZ2 $SAVE/$TITLE-$DATE.tar.bz2 $ARCH 

echo " Ok I am Done.. $TITLE-$DATE.tar.bz2 is Done!!! "
