#!/bin/bash
# SubRip
VER="0.3"
# a tool for <a href="http://script.m-redd.com/dvdre.htm">DvDre x264 to MKV|MP4</a>
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# SubRip DvD Subtitles Depends on
#
# <a href="ttp://dvdbackup.sourceforge.net/">DVDBackup</a>           
# <a href="http://www.mplayerhq.hu/design7/dload.html">MPlayer - MEncoder</a>
# <a href="http://www.bunkus.org/videotools/ogmtools/">DvDxChap - OGMTools</a> 
# <a href="http://tcforge.berlios.de/">Transcode</a>
# <a href="http://mediainfo.sourceforge.net/en">MediaInfo</a>
# <a href="http://untrepid.com/acidrip/lsdvd.html">lsdvd</a>
#
##################################
#      Also See ...
# <a href="http://script.m-redd.com/mi-nfocreate.htm">MI nfoCreate Script</a>
# <a href="http://script.m-redd.com/imdb-dump.htm">iMDB-Dump Script</a>
# <a href="http://script.m-redd.com/imdb-thumbgrab.htm">iMDB-ThumbGrab Script</a>
# <a href="http://script.m-redd.com/vidrip.htm">DVD VidRip</a>
# <a href="http://script.m-redd.com/videnc.htm">DVD VidEnc</a>
# <a href="http://script.m-redd.com/muxit.htm">DVD MuxIt</a>
# <a href="http://script.m-redd.com/audiorip.htm">DVD Audio Rip</a>
#
############################
############################
#####    APPS  PATH    #####
############################
############################
#
## Path to Apps
# path to mplayer
MPLAYER="/usr/bin/mplayer"
# path to mencoder
MENCODER="/usr/bin/mencoder"
# path to tcextract
TCEXTRACT="tcextract"
# path to subtitle2vobsub
SUBTITLE2VOBSUB="subtitle2vobsub"
# path to lsdvd
LSDVD="/usr/bin/lsdvd"
# path to mediainfo
MEDIAINFO="/usr/bin/mediainfo"

############################
############################
##### PATH TO SCRIPTS  #####
############################
############################
#

#
############################
############################
### END PATH TO SCRIPTS ####
############################
############################
# Start Loop
while true
do
############################
############################
##### START QUESTIONS  #####
############################
############################
#
# Change Device Path
subtrip ()
{
echo " SubRip V. $VER"
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
# Change IFO Path
FINDVTS="$(ls $DPATH | grep -i video)"
echo "Video TS Folder: $FINDVTS"
cd $DPATH/$FINDVTS
FINDIFO="$(ls * | grep -i vts_01_0.ifo)"
echo "IFO File: $FINDIFO"
echo "-----------------------------------"
echo " "
IFOPATH="$DPATH/$FINDVTS/$FINDIFO"
echo " IFO Path Default: $IFOPATH "
echo "Change to a Directory of New Device Path "
echo " Handy on the Fly (Press y/n)"
echo "-----------------------------------"
read IFOPATH
case $IFOPATH in
	y|yes)
	  echo "Enter IFOPATH:    "
          echo "------------------"
	   	read IFOPATH ;;
	n|no)
		IFOPATH="$DPATH/$FINDVTS/$FINDIFO" ;;
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
RPATH="$HOME/apps/dvdre/rip/wrkn/sub"
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
		RPATH="$HOME/apps/dvdre/rip/wrkn/sub" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
echo "-----------------------------------"
echo " "
#
# Change VOBFLDR Directory
VOBFLDR="$HOME/apps/dvdre/rip/wrkn/vid"
echo " Vob File Path Default: $VOBFLDR "
echo "SubRip Uses the VOB file to pull the raw"
echo " subtitle streams..."
echo " atleast 12G (Press y/n)"
echo "-----------------------------------"
read VOBFLDR
case $VOBFLDR in
	y|yes)
	  echo "Enter VOBFLDR:    "
          echo "------------------"
	   	read VOBFLDR ;;
	n|no)
		VOBFLDR="$HOME/apps/dvdre/rip/wrkn/vid" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
echo "-----------------------------------"
echo " "
# List DVD Info
$LSDVD $DPATH | awk '/Disc/ {print $1,$2,$3}'
$LSDVD $DPATH | awk '/Longest/ {print $1,$2,$3}'
echo ""
sleep 1
echo ""
echo "-----------------------------------"
TITLE="$($LSDVD $DPATH | awk '/Disc/ {print $3}')"
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
sleep 1
TRACK="$($LSDVD $DPATH | awk '/Longest/ {print $3}')"
# Change Track Number
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
		TRACK=$($LSDVD $DPATH | awk '/Longest/ {print $3}') ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
sleep 1
echo " "
#
# Subtitle List
echo " "
echo "-----------------------------------"
sleep 1
echo " Listing Subtitles On Device "

$LSDVD -s $DPATH | grep -i "Subtitle:"
echo "------------------------------------"
## Language
echo " Rips One Title at a Time.. "
echo " Answer the Following Questions using what just Displayed "
echo "------------------------------------"
echo ""
echo " Choose the Language you Want.. "
echo " The Abreviation.. Only"
echo " Examples: English is en"
echo "           Chinese is zh"
echo "           Spanish is es"
echo "    What Language?"
echo " Look at the List and Example for help"
echo " Enter the Language Hit Return"
echo "-----------------------------------"
read LANG
echo "Language: $LANG"
sleep 1
echo ""
## Stream ID
echo "------------------------------------"
echo ""
echo " Choose the Steam ID that Matches"
echo "      that Language you picked.. "
echo " Examples: Stream id: 0x20"
echo "           Stream id: 0x21"
echo "    just the id 0x20"
echo " Look at the List and Example for Help"
echo " Enter the id and Hit Return"
echo "---------------------------------"
read STREAMID
echo " Stream ID: $STREAMID"
sleep 1
echo ""
#
############################
############################
#####  END  QUESTIONS  #####
############################
############################

echo "#####################"
echo "## Title:    $TITLE"
echo "## Track:    $TRACK"
echo "## Lang:     $LANG"
echo "## StreamID: $STREAMID"
echo "## Device:   $DPATH"
echo "## IFO:      $IFOPATH"
echo "## VobFldr:  $VOBFLDR"
echo "## RipFldr:  $RPATH"
echo "#####################"
sleep 2
############################
############################
#####   START SUB RIP  #####
############################
############################
### Single File VOB Dump Start
###################
###################
ripsvob ()
{
      echo "Starting Single VOB Dump"
$MPLAYER -dvd-device $DPATH  dvd://$TRACK \
          -dumpstream \
          -dumpfile $VOBFLDR/singlefiledump.vob
      echo "Done .. Single VOB Ready for VOB Subextraction"
      echo ""
cd $VOBFLDR
VOBTITLE="$(ls * | grep -i .vob)"
      echo " VOB File Found $VOBTITLE"
      echo " Starting Raw Subtitle Ectraction..."
<$VOBFLDR/$VOBTITLE $TCEXTRACT -t vob -x ps1 -a $STREAMID >$RPATH/$TITLE-$STREAMID-$LANG.raw
      echo " Done.. with Extraction"
      echo ""
      sleep 1
      echo " Starting Raw Subtitle Conversion to VOBSUB .idx .sub .."
$SUBTITLE2VOBSUB -p $RPATH/$TITLE-$STREAMID-$LANG.raw -i $IFOPATH -o $RPATH/$TITLE-$STREAMID-$LANG
      echo " Done.. Subtitles Ready..."
      echo " Restarting SubRip - Press b to Exit Back to DvDre"
#################
### SRip End

}
###################
###################
### Single File VOB Dump End

### SRip Start
###################
echo " SubRip V. $VER"
sleep 3
echo ""
cd $VOBFLDR
VOBTITLE="$(ls * | grep -i .vob)"
if [ "$VOBTITLE" == "" ]; then
      echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      echo "% Oh My Goodness.. I Found No VOB File. %"
      echo "%  ...Did You Rip It? ...               %"
      echo "% Want to Rip the VOB Now?              %"
      echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      echo ""
      echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      echo "% A) Rip the VOB Now                    %"
      echo "% B) Exit Back to DvDre                 %"
      echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      read CHOICE
      case "$CHOICE" in
            "a" ) ripsvob ;;
            "b" ) goodbye ;;
            *)
            echo "Sorry Error"
            echo "Valid Choices a, b"
            exit 1;;
      esac
      else
            echo " VOB File Found $VOBTITLE"
            echo " Starting Raw Subtitle Ectraction..."
            <$VOBFLDR/$VOBTITLE $TCEXTRACT -t vob -x ps1 -a $STREAMID >$RPATH/$TITLE-$STREAMID-$LANG.raw
            echo " Done.. with Extraction"
            echo ""
            sleep 1
            echo " Starting Raw Subtitle Conversion to VOBSUB .idx .sub .."
            $SUBTITLE2VOBSUB -p $RPATH/$TITLE-$STREAMID-$LANG.raw -i $IFOPATH -o $RPATH/$TITLE-$STREAMID-$LANG
            echo " Done.. Subtitles Ready..."
            echo " Restarting SubRip - Press b to Exit Back to DvDre"
fi

#################
### SRip End

}

# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " SubRip V. $VER"
echo "!!!!!!!!!!!!!!!!!!"

exit 0

}
########
########
#
############################
############################
#####   END SUB RIP    #####
############################
############################
clear
echo " SubRip V. $VER"
sleep 3
echo ""
echo "A) Rip (Another) Subitile Track"
echo "B) Quit - Return to DVDre"
echo "--------------------------"
read CHOICE
case "$CHOICE" in
      "a" ) subtrip ;;
      "b" ) goodbye ;;
       *)
            echo "Im Sorry Error"
            echo "Valid Choices a,b"
              exit 1 ;;
esac
echo ""

#
############################
############################
#####  END  QUESTIONS  #####
############################
############################
# End of Start Loop
done

