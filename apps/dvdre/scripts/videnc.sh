#!/bin/bash
# VidEnc
VER="0.3.2"
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
# <a href="http://script.m-redd.com/vidrip.htm">DVD VidRip</a>
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
LOGS="$HOME/apps/dvdre/logs"
cd $LOGS
if [ -e $LOGS ]; then
  rm $LOGS/*.log
fi
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
# add path to MI-NFOcreate.sh
MINFOC="$HOME/apps/dvdre/rip/info/mi-nfocreate.sh"
# add path to iMBD-Dump.sh
IMDBDUMP="$HOME/apps/dvdre/rip/info/imdb-dump.sh"
# add path to iMDB-thumbgrab.sh
IMDBTGRAB="$HOME/apps/dvdre/rip/info/imdb-thumbgrab.sh"
#
############################
############################
### END PATH TO SCRIPTS ####
############################
############################

############################
############################
#### START ENC QUESTION ####
############################
############################
#

encdvd ()
{
echo "VidEnc V. $VER"
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
	echo "Error .. Valid Choices y|n"
	exit 1 ;;
    esac
echo ""
#
echo "-----------------------------------"
echo " "
#
# Change Working Directory
RPATH="$HOME/apps/dvdre/rip/wrkn/vid"
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
		RPATH="$HOME/apps/dvdre/rip/wrkn/vid" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
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
$LSDVD -v $DPATH | grep -i "Title:"
echo ""
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
		TRACK=$($LSDVD $DPATH | grep "Longest track:" | awk '{print $3}') ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "-----------------------------------"
sleep 1
# Change Bitrate
BITRATE="1500"
echo " Bitrate Default: $BITRATE "
echo "Use a Bitrate Calc. or Judge by Time "
echo "  - 1500 per 1.5 is fine (Press y/n)"
echo "-----------------------------------"
read BITRATE
case $BITRATE in
	y|yes)
	  echo "Enter Bitrate:    "
          echo "------------------"
	   	read BITRATE ;;
	n|no)
		BITRATE="1500" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
# Cleanup first
if [ -e $RPATH/cropdetect.txt ]; then
  rm $RPATH/cropdetect.txt
fi
echo "Auto Grabbing Crop Value"
#grab crop
echo "-----------------------------------"
sleep 1
$MENCODER -dvd-device $DPATH dvd://$TRACK -oac lavc -ovc lavc -vf cropdetect -o /dev/null > $RPATH/cropdetect.txt & PID=$!; sleep 15; kill "$PID"
CROP="$(awk '/-vf/{crop=$19} END{sub(").","", crop); print crop}' $RPATH/cropdetect.txt)"
sleep 1
echo "Done Grabbing Crop Value"
echo " $CROP"
echo " "
#
# Change Scale Value
echo "-----------------------------------"
sleep 1
SCALE="harddup"
	  echo " Enter Scale Value - Default is $SCALE, should be fine"
          echo "  need to scale down then add values like example "
          echo " Example: scale=480:-2  "
          echo " need help here? http://google.com"
          echo " Want to Change Scale Value? (Press y/n)"
          echo "------------------"
read SCALE
case $SCALE in
	y|yes)
          echo "Enter Scale Value"
          echo "------------------"
	   	read SCALE ;;
	n|no)
		SCALE="harddup" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
# XOPS
############################
############################
##### X264 OPTS EXTRA  #####
############################
############################
#
echo "What do you want to do?"
echo "A) Good Quality"
echo "B) High Quality"
echo "C) Very High Quality"
echo "D) Extreme High Quality"
echo "E) Insane High Quality"
echo "F) Near Lossless Quality"
echo "G) Anime Good Quality"
echo "H) Anime High Quality"
echo "I) QuickTime Quality"
echo "J) QuickTime High Quality"
echo " "
echo "-------------------------"
echo "Valid Choices are A,B,C,D,E,F,G,H,I,J"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        A|a)
                echo "Choice was Good Quality"
                XOPS="frameref=3:mixed_refs:bframes=4:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=16:subq=6:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        B|b)
                echo "Choice was High Quality"
                XOPS="frameref=4:mixed_refs:bframes=5:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        C|c) 
                echo "Choice was Very High Qaulity"
                XOPS="frameref=5:mixed_refs:bframes=6:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=32:subq=8:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        D|d)
                echo "Choice was Extreme High Quality"
                XOPS="frameref=6:mixed_refs:bframes=7:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=esa:me_range=48:subq=9:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        E|e)
                echo "Choice was Insane High Quality"
                XOPS="frameref=16:mixed_refs:bframes=10:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=tesa:me_range=64:subq=9:psy_rd=0.6,0.2:chroma_me:trellis=2:cabac:deblock:8x8dct:partitions=all:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        F|f) 
                echo "Choice was Near Lossless Quality"
                XOPS="bitrate=crf=18:frameref=2:bframes=3:b_adapt=2:b_pyramid:weight_b:subq=5:me=dia:direct_pred=spatial:partitions=p8x8,b8x8,i4x4:deblock:chroma_me:trellis=1:cabac:no8x8dct:fast_pskip:nodct_decimate:level_idc=41"
                ;;
        G|g)
                echo "Choice was Anime Good Quality"
                XOPS="frameref=8:mixed_refs:bframes=5:b_adapt=2:b_pyramid:noweight_b:direct_pred=auto:me=hex:me_range=16:subq=6:psy_rd=0.0,0.0:aq_strength=0.5:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        H|h)
                echo "Choice was Anime High Quality"
                XOPS="frameref=10:mixed_refs:bframes=5:b_adapt=2:b_pyramid:noweight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.0,0.0:aq_strength=0.5:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        I|i) 
                echo "Choice was QuickTime Quality"
                XOPS="frameref=3:mixed_refs:bframes=3:b_adapt=2:nob_pyramid:weight_b:direct_pred=auto:me=hex:me_range=16:subq=6:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:no8x8dct:partitions=p8x8,b8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        J|j) 
                echo "Choice was QuickTime High Quality"
                XOPS="frameref=3:mixed_refs:bframes=3:b_adapt=2:nob_pyramid:weight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:no8x8dct:partitions=p8x8,b8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
          *)
                echo "Valid Choices are A,B,C,D,E,F,G,H,I,J"
                exit 1
                ;;
esac
echo " "
#
############################
############################
#####  END x264 OPTS   #####
############################
############################
#
############################
############################
#####   END QUESTION   #####
############################
############################

sleep 1

############################
############################
#####    START RIP     #####
############################
############################
#

sleep 1
echo "###############################"
echo "##  Title Name: $TITLE "
echo "##  Track Number: $TRACK "
echo "##  Crop Detected: $CROP "
echo "##  Bitrate Detected: $BITRATE "
echo "##  Scale Detected: $SCALE "
echo "##  Device Path: $DPATH"
echo "##  Rip Path: $RPATH"
echo "##  X264OPTS: $XOPS "
echo "###############################"
sleep 3
# Clean Up Chapters.txt
if [ -e $RPATH/chapters.txt ]; then
  rm $RPATH/chapters.txt
fi
# Grab Chapters TXT File
echo " Dumping Chapters Info to TXT File "
$DVDXCHAP -t $TRACK $DPATH  > $RPATH/chapters.txt
echo " Chapters Files is in $RPATH"
sleep 1
# Dump DVDR to single VOB File
sleep 1
echo " Dumping New DVD to a Single file $TITLE.vob"
sleep 2
$MPLAYER -dvd-device $DPATH  dvd://$TRACK\
          -dumpstream\
          -dumpfile $RPATH/$TITLE.vob
echo "Finished Ripping Title to Harddrive"
sleep 1

# encode pass 1
##############
#
##
echo "Starting Encode Pass 1"
#
$MENCODER  -v $RPATH/$TITLE.vob \
           -nosound \
           -vf pullup,softskip,$CROP,$SCALE \
           -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:turbo=1:pass=1 \
           -of rawvideo \
           -o $RPATH/$TITLE.264

echo "First Pass Done!..............."
echo ""
sleep 1
# encode pass 3
##############
#
##
echo "Starting Third Pass of Encode Before Second.. Sync Reasons!"
$MENCODER  -v $RPATH/$TITLE.vob \
           -nosound -vf pullup,softskip,$CROP,$SCALE \
           -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:pass=3 \
           -of rawvideo \
           -o $RPATH/$TITLE.264

echo "Third Pass Done............"
echo ""
sleep 1
# encode pass 2
##############
#
##
echo "Starting Second, Last Pass of Encode!"
$MENCODER  -v $RPATH/$TITLE.vob \
           -nosound -vf pullup,softskip,$CROP,$SCALE \
           -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:pass=2 \
           -of rawvideo \
           -o $RPATH/$TITLE.264

echo "Second Pass is Last and is Done............"
echo ""
sleep 1
echo " ...Finished Video Rip Section... "

#
############################
############################
#####     END  RIP     #####
############################
############################

}
# Encode From VOB
############################
############################
#####  START QUESTION  #####
############################
############################
encvob ()
{
echo "VidEnc V. $VER"
sleep 3
# Change Device Path
DVDRE="$HOME/apps/dvdre"
WRKVID="$DVDRE/rip/wrkn/vid"
echo "-----------------------------------"
echo " "
cd $WRKVID
ENCVOB="$(ls | grep *.vob)"
echo " VOB File to Encode: $ENCVOB "
echo "-----------------------------------"
echo " "
# Change Working Directory
RPATH="$HOME/apps/dvdre/rip/wrkn/vid/"
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
		RPATH="$HOME/apps/dvdre/rip/wrkn/vid" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
#
echo ""
sleep 1
echo ""
echo "-----------------------------------"
TITLE="Your_DVD_Encode"
# Change Title Name
echo " Title Name: $TITLE"
echo "No Title Grab Tell me the Title you want"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLE
case $TITLE in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLE ;;
	n|no)
		TITLE="Your_DVD_Encode" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
sleep 1
echo ""
echo "-----------------------------------"
sleep 1
# Change Bitrate
BITRATE="1500"
echo " Bitrate Default: $BITRATE "
echo "Use a Bitrate Calc. or Judge by Time "
echo "  - 1500 per 1.5 is fine (Press y/n)"
echo "-----------------------------------"
read BITRATE
case $BITRATE in
	y|yes)
	  echo "Enter Bitrate:    "
          echo "------------------"
	   	read BITRATE ;;
	n|no)
		BITRATE="1500" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
# Cleanup first
if [ -e $RPATH/cropdetect.txt ]; then
  rm $RPATH/cropdetect.txt
fi
echo "Auto Grabbing Crop Value"
#grab crop
echo "-----------------------------------"
sleep 1
cd $WRKVID
$MENCODER $ENCVOB -oac lavc -ovc lavc -vf cropdetect -o /dev/null > $RPATH/cropdetect.txt & PID=$!; sleep 15; kill "$PID"
CROP="$(awk '/-vf/{crop=$19} END{sub(").","", crop); print crop}' $RPATH/cropdetect.txt)"
sleep 1
echo "Done Grabbing Crop Value"
echo " $CROP"
echo " "
#
# Change Scale Value
echo "-----------------------------------"
sleep 1
SCALE="harddup"
	  echo " Enter Scale Value - Default is $SCALE, should be fine"
          echo "  need to scale down then add values like example "
          echo " Example: scale=480:-2  "
          echo " need help here? http://google.com"
          echo " Want to Change Scale Value? (Press y/n)"
          echo "------------------"
read SCALE
case $SCALE in
	y|yes)
          echo "Enter Scale Value"
          echo "------------------"
	   	read SCALE ;;
	n|no)
		SCALE="harddup" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
#
# XOPS
############################
############################
##### X264 OPTS EXTRA  #####
############################
############################
#
echo "What do you want to do?"
echo "A) Good Quality"
echo "B) High Quality"
echo "C) Very High Quality"
echo "D) Extreme High Quality"
echo "E) Insane High Quality"
echo "F) Near Lossless Quality"
echo "G) Anime Good Quality"
echo "H) Anime High Quality"
echo "I) QuickTime Quality"
echo "J) QuickTime High Quality"
echo " "
echo "-------------------------"
echo "Valid Choices are A,B,C,D,E,F,G,H,I,J"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        A|a)
                echo "Choice was Good Quality"
                XOPS="frameref=3:mixed_refs:bframes=4:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=16:subq=6:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        B|b)
                echo "Choice was High Quality"
                XOPS="frameref=4:mixed_refs:bframes=5:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        C|c) 
                echo "Choice was Very High Qaulity"
                XOPS="frameref=5:mixed_refs:bframes=6:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=umh:me_range=32:subq=8:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        D|d)
                echo "Choice was Extreme High Quality"
                XOPS="frameref=6:mixed_refs:bframes=7:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=esa:me_range=48:subq=9:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        E|e)
                echo "Choice was Insane High Quality"
                XOPS="frameref=16:mixed_refs:bframes=10:b_adapt=2:b_pyramid:weight_b:direct_pred=auto:me=tesa:me_range=64:subq=9:psy_rd=0.6,0.2:chroma_me:trellis=2:cabac:deblock:8x8dct:partitions=all:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        F|f) 
                echo "Choice was Near Lossless Quality"
                XOPS="bitrate=crf=18:frameref=2:bframes=3:b_adapt=2:b_pyramid:weight_b:subq=5:me=dia:direct_pred=spatial:partitions=p8x8,b8x8,i4x4:deblock:chroma_me:trellis=1:cabac:no8x8dct:fast_pskip:nodct_decimate:level_idc=41"
                ;;
        G|g)
                echo "Choice was Anime Good Quality"
                XOPS="frameref=8:mixed_refs:bframes=5:b_adapt=2:b_pyramid:noweight_b:direct_pred=auto:me=hex:me_range=16:subq=6:psy_rd=0.0,0.0:aq_strength=0.5:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        H|h)
                echo "Choice was Anime High Quality"
                XOPS="frameref=10:mixed_refs:bframes=5:b_adapt=2:b_pyramid:noweight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.0,0.0:aq_strength=0.5:chroma_me:trellis=1:cabac:deblock:8x8dct:partitions=p8x8,b8x8,i8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        I|i) 
                echo "Choice was QuickTime Quality"
                XOPS="frameref=3:mixed_refs:bframes=3:b_adapt=2:nob_pyramid:weight_b:direct_pred=auto:me=hex:me_range=16:subq=6:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:no8x8dct:partitions=p8x8,b8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
        J|j) 
                echo "Choice was QuickTime High Quality"
                XOPS="frameref=3:mixed_refs:bframes=3:b_adapt=2:nob_pyramid:weight_b:direct_pred=auto:me=umh:me_range=24:subq=7:psy_rd=0.6,0.2:chroma_me:trellis=1:cabac:deblock:no8x8dct:partitions=p8x8,b8x8,i4x4:nofast_pskip:nodct_decimate:level_idc=41"
                ;;
          *)
                echo "Valid Choices are A,B,C,D,E,F,G,H,I,J"
                exit 1
                ;;
esac
echo " "
#
############################
############################
#####  END x264 OPTS   #####
############################
############################
#
############################
############################
#####   END QUESTION   #####
############################
############################

sleep 1

############################
############################
#####    START RIP     #####
############################
############################
#

sleep 1
echo "###############################"
echo "##  Title Name: $TITLE "
echo "##  Crop Detected: $CROP "
echo "##  Bitrate Detected: $BITRATE "
echo "##  Scale Detected: $SCALE "
echo "##  VOB File: $ENCVOB"
echo "##  Rip Path: $RPATH"
echo "##  X264OPTS: $XOPS "
echo "###############################"
sleep 3

# encode pass 1
##############
#
##
echo "Starting Encode Pass 1"
#
cd $WRKVID
mencoder $ENCVOB \
         -nosound \
         -vf pullup,softskip,$CROP,$SCALE \
         -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:turbo=1:pass=1 \
         -of rawvideo \
         -o $RPATH/$TITLE.264

echo "First Pass Done!..............."
echo ""
sleep 1
# encode pass 3
##############
#
##
echo "Starting Third Pass of Encode Before Second.. Sync Reasons!"
$MENCODER  $ENCVOB \
            -nosound -vf pullup,softskip,$CROP,$SCALE \
            -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:pass=3 \
            -of rawvideo \
            -o $RPATH/$TITLE.264

echo "Third Pass Done............"
echo ""
sleep 1
# encode pass 2
##############
#
##
echo "Starting Second, Last Pass of Encode!"
$MENCODER  $ENCVOB \
            -nosound -vf pullup,softskip,$CROP,$SCALE \
            -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:pass=2 \
            -of rawvideo \
            -o $RPATH/$TITLE.264

echo "Second Pass is Last and is Done............"
echo ""
sleep 1
echo " ...Finished Video Rip Section... "

#
############################
############################
#####     END  RIP     #####
############################
############################

}
# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo "VidEnc V. $VER"
echo "!!!!!!!!!!!!!!!!!!"

exit 0

}

############################
############################
#####  START QUESTION  #####
############################
############################
#


# DVD or VOB
echo "VidEnc V. $VER"
sleep 3
echo ""
echo " A) Enc DVD from DVD|IMG|ISO"
echo " B) Enc DVD from A Ripped VOB File"
echo " C) Quit Exit"
echo "-----------------------------------"
echo ""

read CHOICE

	case $CHOICE in
	"a" ) encdvd ;;
        "b" ) encvob ;;
	"c" ) goodbye ;;
	  *) 
		echo "Error ... Valid Choices are 1,2,3"
		exit 1 ;;
    esac

exit 0
#
############################
############################
####    END  SCRIPT     ####
############################
############################


