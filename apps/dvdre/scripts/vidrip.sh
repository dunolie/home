#!/bin/bash
# VidRip
VER="0.2.3"
# a tool for <a href="http://script.m-redd.com/dvdre.htm">DvDre x264 to MKV|MP4</a>
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# VidRip DvD to MKV or MP4 Depends on
#
# <a href="http://dvdbackup.sourceforge.net/">DVDBackup</a>           
# <a href="http://www.mplayerhq.hu/design7/dload.html">MPlayer - MEncoder</a>
# <a href="http://www.bunkus.org/videotools/ogmtools/">DvDxChap - OGMTools</a> 
# <a href="http://www.videolan.org/developers/x264.html">X264</a>
# <a href="http://liba52.sourceforge.net/">A52Dec</a>
# <a href="http://sourceforge.net/projects/faac/">FAAC</a>
# <a href="http://gpac.sourceforge.net/home_download.php">MP4Box - GPAC</a>
# <a href="http://www.bunkus.org/videotools/mkvtoolnix/">MKVToolNix</a>
# <a href="http://mediainfo.sourceforge.net/en">MediaInfo</a>
# <a href="http://untrepid.com/acidrip/lsdvd.html">lsdvd</a>
#
##################################
#      Also See ...
# <a href="http://script.m-redd.com/mi-nfocreate.htm">MI nfoCreate Script</a>
# <a href="http://script.m-redd.com/imdb-dump.htm">iMDB-Dump Script</a>
# <a href="http://script.m-redd.com/imdb-thumbgrab.htm">iMDB-ThumbGrab Script</a>
# <a href="http://script.m-redd.com/videnc.htm">DVD VidEnc</a>
# <a href="http://script.m-redd.com/muxit.htm">DVD MuxIt</a>
# <a href="http://script.m-redd.com/audiorip.htm">DVD Audio Rip</a>
# <a href="http://script.m-redd.com/subrip.htm">DVD Subtitle Rip</a>
#
############################
############################
#####    APPS  PATH    #####
############################
############################
#
## Path to Apps
#
# Path to DVDBackup
DVDBACKUP="/usr/bin/dvdbackup"
# path to mplayer
MPLAYER="/usr/bin/mplayer"
# path to mencoder
MENCODER="/usr/bin/mencoder"
# path to dvdxchap
DVDXCHAP="/usr/bin/dvdxchap"
# path to a52dec
A52DEC="/usr/bin/a52dec"
# path to faac
FAAC="/usr/bin/faac"
# path to MP4Box
MP4BOX="/usr/bin/MP4Box"
# MKV Tools
# path to mkvmerge
MKVMERGE="/usr/bin/mkvmerge"
# to be worked in to rip ts|m2ts files later
# path to mkvinfo
MKVINFO="/usr/bin/mkvinfo"
# path to mkvextract
MKVEXTRACT="/usr/bin/mkvextract"
# path to lsdvd
LSDVD="/usr/bin/lsdvd"
# path to mediainfo
MEDIAINFO="/usr/bin/mediainfo"
#
############################
############################
#####  END APPS PATH   #####
############################
############################

############################
############################
#####    START RIP     #####
############################
############################
# Rip to DVDR
ripdvdr ()
{
echo "VidRip V. $VER"
sleep 3
# Clean Up Chapters.txt
if [ -f $RPATH/chapters.txt ]; then
  rm $RPATH/chapters.txt
fi
# Grab Chapters TXT File
echo " Dumping Chapters Info to TXT File "
$DVDXCHAP -t $TRACK $DPATH  > $RPATH/vid/chapters.txt
sleep 2
echo " Chapters Files is in $RPATH"
sleep 1
DVDR="$TITLE-DVDR"
echo "###############################"
echo "##  Title Name: $DVDR "
echo "##  Device Path: $DPATH"
echo "##  Rip Path: $RPATH"
echo "###############################"
sleep 3
# Rip DVD to HardDisc
##
sleep 1
echo " Ripping DVD to Hard Disc .. $RPATH/$DVDR "
sleep 2
$DVDBACKUP -M -i $DPATH -o $RPATH/dvdr -n $DVDR
sleep 1
echo " Done .. "
sleep 1
#

############################
############################
#####  END  DVDR RIP   #####
############################
############################

exit 0
}
# Rip to VOB
ripdvdvob ()
{
echo "VidRip V. $VER"
sleep 3
echo " ---------------------------"
TRACK="$($LSDVD $DPATH | awk '/Longest/ {print $3}')"
# Change Track Number
$LSDVD $DPATH | grep -i "Title:" | awk '{print $1,$2,$3,$4}'
echo " Track Number: $TRACK "
echo "Wanna Encode a Different Track?: (Press y/n)"
echo "-----------------------------------"
read TRACK
case $TRACK in
	y|yes)
	  echo "Enter Track Number: "
          echo "------------------"
	   	read TRACK ;;
	n|no)
		TRACK=$($LSDVD $DPATH | grep "Longest track:" | awk '{print $3}') ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "###############################"
echo "##  Title Name:   $TITLE.vob "
echo "##  Track Number: $TRACK"
echo "##  Device Path:  $DPATH"
echo "##  Rip Path:     $RPATH/vid"
echo "###############################"
sleep 3
sleep 1
# Clean Up Chapters.txt
if [ -f $RPATH/chapters.txt ]; then
  rm $RPATH/chapters.txt
fi
# Grab Chapters TXT File
echo " Dumping Chapters Info to TXT File "
$DVDXCHAP -t $TRACK $DPATH  > $RPATH/vid/chapters.txt
sleep 2
echo " Chapters Files is in $RPATH"
sleep 1
# Dump DVDR to single VOB File
sleep 1
echo " Dumping New DVD to a Single file $TITLE.vob"
sleep 2
$MPLAYER -dvd-device $DPATH  dvd://$TRACK\
          -dumpstream\
          -dumpfile $RPATH/vid/$TITLE.vob
echo "Finished Ripping Title to Harddrive"
sleep 1
#

############################
############################
#####     END  RIP     #####
############################
############################

exit 0
}
# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " VidRip V. $VER"
echo "!!!!!!!!!!!!!!!!!!"
sleep 4

exit 0

}

############################
############################
#####  START QUESTION  #####
############################
############################

# Change Device Path
echo "VidRip V. $VER"
sleep 3
echo ""
echo "-----------------------------------"
echo " "
DPATH="/media/dvd"
echo " Device Path Default: $DPATH "
echo "Change to a Directory of New Device Path "
echo " Handy on the Fly (Press y/n)"
echo "-----------------------------------"
read DPATH
case $DPATH in
	y|yes)
	  echo "Enter DPATH:    "
          echo "------------------"
	   	read DPATH ;;
	n|no)
		DPATH="/media/dvd" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
echo "-----------------------------------"
echo " "
#
# Change Working Directory
RPATH="$HOME/apps/dvdre/rip/wrkn"
echo " Working Path Default: $RPATH "
echo "Change to a Directory with Plenty Room"
echo " atleast 12G (Press y/n)"
echo "-----------------------------------"
read RPATH
case $RPATH in
	y|yes)
	  echo "Enter RPATH:    "
          echo "------------------"
	   	read RPATH ;;
	n|no)
		RPATH="$HOME/apps/dvdre/rip/wrkn" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
echo "-----------------------------------"
echo " "
#
# List DVD Info
echo " Disc Info Found "
echo ""
sleep 1
echo "-----------------------------------"
TITLE="$($LSDVD $DPATH/ | awk '/Disc/ {print $3}')"
# Change Title Name
echo " Title Name: $TITLE"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLE
case $TITLE in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLE ;;
	n|no)
		TITLE=$($LSDVD $DPATH | awk '/Disc/ {print $3}') ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "-----------------------------------"
##
echo ""
echo " 1) Rip DVD to HardDisc DVDR"
echo " 2) Rip DVD to HardDisc VOB Single File for use with VidEnc|AudioRip|SubRip"
echo " 3) Restart Script"
echo " 4) Quit Exit"
echo "-----------------------------------"
echo ""

read CHOICE

	case $CHOICE in
	"1" ) ripdvdr ;;
        "2" ) ripdvdvob ;;
	"3" ) restart ;;
	"4" ) goodbye ;;
	*) 
		echo "Error ... Valid Choices are 1,2,3"
		exit 1 ;;
    esac

exit 0
#
############################
############################
#####   END QUESTION   #####
############################
############################

