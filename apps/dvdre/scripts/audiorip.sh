#!/bin/bash
# AudioRip
VER="0.2.3"
# a tool for <a href="http://script.m-redd.com/dvdre.htm">DvDre x264 to MKV|MP4</a>
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# AudioRip DvD Subtitles Depends on
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
# <a href="http://script.m-redd.com/vidrip.htm">DVD VidRip</a>
# <a href="http://script.m-redd.com/videnc.htm">DVD VidEnc</a>
# <a href="http://script.m-redd.com/muxit.htm">DVD MuxIt</a>
# <a href="http://script.m-redd.com/subrip.htm">DVD Subtitle Rip</a>
#
############################
############################
#####    APPS  PATH    #####
############################
############################
#
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
##### PATH TO SCRIPTS  #####
############################
############################
#
# Start Loop
while true
do

#
############################
############################
### END PATH TO SCRIPTS ####
############################
############################

############################
############################
#####   START   RIP    #####
############################
############################
#

convertaudio ()
{
# Format to WAV Conversion
echo "Conerting $FORMAT to WAV"
$A52DEC $RPATH/$TITLE-$AID-$LANG.$FORMAT\
        -o wavdolby > $RPATH/$TITLE-$AID-$LANG.wav
echo "Done Converting AC3 to WAV"

# WAV to AAC Conversion
echo "Converting WAV to FAAC"
$FAAC $RPATH/$TITLE-$AID-$LANG.wav $RPATH/$TITLE-$AID-$LANG.aac -b 256 -q 100
echo "Done Converting WAV to FAAC"
clear
echo ""
echo "************************"
echo "************************"
echo " AudioRip .. Done.."
echo " AudioRip does infinite loop "
echo "  to allow multirips of Subtitles"
echo "************************"
echo "************************"
echo ""
echo " Want to Convert $TITLE.$FORMAT to AAC?"
echo " High Qaulity AAC.."
echo "A) Rip Another Track "
echo "B) Exit"
echo "--------------------------"
read CHOICE
case "$CHOICE" in
      "a" ) relooparip ;;
      "b" ) goodbye ;;
       *)
            echo "Im Sorry Error"
            echo "Valid Choices a,b"
              exit 1 ;;
esac

}
# No Conversion End Start Loop
relooparip ()
{
echo " AudioRip V. $VER"
sleep 3
echo ""
echo "************************"
echo "************************"
echo " AudioRip .. Done.."
echo " AudioRip does infinite loop "
echo "  to allow multirips of Subtitles"
echo "************************"
echo "************************"
echo ""
echo "************************"
echo " Just Press c then Enter to Quit.. "
echo " Thanx. Restarting Script Now.."
echo "************************"
echo ""
echo " AudioRip V. $VER"
sleep 4

#
############################
############################
#####    END    RIP    #####
############################
############################
# End of the Start Loop

}
# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " AudioRip V. $VER"
echo "!!!!!!!!!!!!!!!!!!"
sleep 4

exit 0

}

############################
############################
##### START QUESTIONS  #####
############################
############################
#
echo " AudioRip V. $VER"
sleep 3
# Change Device Path
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
	echo "Error .. Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
# Change VidFldr Path
echo "-----------------------------------"
echo " "
# Change Working Directory
RPATH="$HOME/apps/dvdre/rip/wrkn/audio"
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
		RPATH="$HOME/apps/dvdre/rip/wrkn/audio" ;;
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
# Cleanup first
if [ -f $RPATH/trackinfo.txt ]; then
  rm $RPATH/trackinfo.txt 
fi
$MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK  -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $1,$2,$1,$2,$3,$9,$10,$7,$8}' | tr -d "." > $RPATH/trackinfo.txt;cat -n $RPATH/trackinfo.txt 
echo " Track Number: $TRACK "
echo "Wanna Dump a Different Track?: (Press y/n)"
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
echo ""
echo "-----------------------------------"
sleep 1
echo " "
#
echo " Choose From Below"
# Change AID Number
AID=$($MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $10}' | tr -d ".")
echo ""
$MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK  -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | awk '{print $1,$2,$1,$2,$3,$9,$10,$7,$8}' | tr -d "."
echo " The Above are the Audio Tracks.."
echo "---------------------------------"
echo " Choose the Audio Track By AID Number"
echo " Default is 1st Audio Track"
echo " Examples: 128,129,130"
echo " audio stream: 0 aid: 128 language: ko"
echo " Aid default is $AID  Change?  (Press y/n)"
echo "-----------------------------------"
read AID
case $AID in
	y|yes)
        echo " Example: 128,129,130"
	  echo "Enter AID Number: "
          echo "------------------"
	   	read AID ;;
	n|no)
		AID=$($MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $10}' | tr -d "." ) ;;
	*)
	echo "Valid Choices (y|n)...Error Quitting"
	exit 1 ;;
    esac
echo ""
echo "-----------------------------------"
sleep 1
echo " Choose From Below"
echo " "
# Change Language - Use to Label On Merge
LANG=$($MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $8}')
$MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | awk '{print $1,$2,$3,$9,$10,$7,$8}'
echo " The Above are the Audio Tracks.."
echo "---------------------------------"
echo ""
echo " Default Language is First Track"
echo " Language: $LANG "
echo " Example: en,es,ja,zh,ko"
echo " audio stream: 0 aid: 128 language: ko"
echo " examples is ko"
echo " Default 1st Track Language: $LANG "
echo " Wanna Change This?    (Press y/n)"
echo "-----------------------------------"
read LANG
case $LANG in
	y|yes)
	  echo "Enter Language Abbreviation "
        echo " Examples: en,es,ko,ja" 
        echo " just needs to be the "
        echo " two letters For That Language"
          echo "------------------"
	   	read LANG ;;
	n|no)
		LANG=$($MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $8}') ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "-----------------------------------"
sleep 1
echo " "
#
echo ""
FORMAT=$($MPLAYER -vo null -v -dvd-device $DPATH dvd://$TRACK -frames 0 2>/dev/null | egrep -i '(aid|audio stream)' | head -1 | awk '{print $5}')
echo " Dumping Audio Track in $FORMAT Format"
sleep 2
echo ""

#
echo "######################"
echo "## Device:   $DPATH"
echo "## Title:    $TITLE"
echo "## Track:    $TRACK"
echo "## Aid:      $AID"
echo "## Language: $LANG"
echo "## Format:   $FORMAT"
echo "######################"
sleep 2
echo " Starting the Rip Now..."
#
sleep 1

# Dump Audio to Container of Choice
echo " Dumping Audio $TITLE.$FORMAT to $RPATH"
$MPLAYER -dvd-device $DPATH dvd://$TRACK\
          -aid $AID\
          -dumpaudio -dumpfile $RPATH/$TITLE-$AID-$LANG.$FORMAT

echo "Done Dumping $FORMAT to $RPATH"
echo ""
echo ""
echo "--------------------------"
echo " Want to Convert $TITLE.$FORMAT to AAC?"
echo " High Qaulity AAC.."
echo "A) Yes Convert $TITLE.$FORMAT to $TITLE.aac Format "
echo "B) Rip Another Audio Track"
echo "C) Quit - Return to DVDre"
echo "--------------------------"
read CHOICE
case "$CHOICE" in
      "a" ) convertaudio ;;
      "b" ) relooparip ;;
      "c" ) goodbye ;;
       *)
            echo "Im Sorry Error"
            echo "Valid Choices a,b,c"
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

