#!/bin/bash
# MuxIt
VER="0.3"
# a tool for <a href="http://script.m-redd.com/dvdre.htm">DvDre x264 to MKV|MP4</a>
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# MuxIt DvD to MKV or MP4 Depends on
#
# <a href="http://dvdbackup.sourceforge.net/">DVDBackup</a>           
# <a href="http://www.mplayerhq.hu/design7/dload.html">MPlayer - MEncoder</a>
# <a href="http://www.bunkus.org/videotools/ogmtools/">DvDxChap - OGMTools</a> 
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
# <a href="http://script.m-redd.com/audiorip.htm">DVD Audio Rip</a>
# <a href="http://script.m-redd.com/subrip.htm">DVD Subtitle Rip</a>
##################################
#
############################
############################
#####    APPS  PATH    #####
############################
############################
#
## Path to Apps
#
# path to mplayer
MPLAYER="/usr/bin/mplayer"
# path to mencoder
MENCODER="/usr/bin/mencoder"
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
#####   PATH TO DIR    #####
############################
############################
#
# Temp Directory
DVDRE="$HOME/apps/dvdre"
# Done Folder
DONE="$DVDRE/rip/done"
# Working Directory
WRKN="$DVDRE/rip/wrkn"
# Video Directory
VIDDIR="$WRKN/vid"
# Audio Directory
AUDIODIR="$WRKN/audio"
# Subtitle Directory
SUBDIR="$WRKN/sub"
#
CHAPTERS="$VIDDIR/chapters.txt"
############################
############################
###   END PATH TO DIR   ####
############################
############################

############################
############################
###   MKV MP4 Questions  ###
############################
############################
#
# MUX MKV
muxmkv ()
{
### Video Start
################
cd $VIDDIR
echo ""
echo " Mux to MKV "
echo " MuxIt V. $VER"
sleep 1
echo ""
echo "------------------"
# 264 to Mux
VIDTOMUX="$(ls | grep *.264)"
echo " 264 File to Mux" 
echo " $VIDTOMUX"

# TITLE
TITLE="$VIDTOMUX"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLE
case $TITLE in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLE ;;
	n|no)
		TITLE="$VIDTOMUX" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLE"
echo ""
sleep 2

### FPS Start
################
# Clean First
if [ -e $VIDDIR/fps.txt ]; then
  rm $VIDDIR/fps.txt
fi
$MEDIAINFO $VIDDIR/$VIDTOMUX | grep fps | cut -f 2 -d ":" | cut -f 1 -d "f" | tr -d " " | tail -1 > fps.txt
MKVFPS="$(cat fps.txt)"
if [ $MKVFPS = "29.970" ]; then
      MKVFPS="29.97fps"
elif [ $MKVFPS = "25.000" ]; then
      MKVFPS="25fps"
elif [ $MKVFPS = "24.000" ]; then
      MKVFPS="24fps"
elif [ $MKVFPS = "23.976" ]; then
      MKVFPS="23.976fps"
fi
echo " FPS FOUND: $MKVFPS"
echo ""
echo "------------------"
################
### FPS End
################
### Video End

### Audio Start
################
cd $AUDIODIR
LISTAUDIO=$(ls | grep "*.a*")
if [ "$LISTAUDIO" == "*.ac3" ];then
    LISTAUDIO=$(ls *.ac3 >> $AUDIODIR/audiofiles.txt)
elif [ "$LISTAUDIO" == "*.aac" ];then
    LISTAUDIO=$(ls *.aac >> $AUDIODIR/audiofiles.txt)
elif [ "$LISTAUDIO" != "*.a*" ];then
    LISTAUDIO=$(ls *.dts >> $AUDIODIR/audiofiles.txt)
fi 
AUDFILZ="$(cat -n $AUDIODIR/audiofiles.txt | tail -1 | awk '{print $1}')"
AUDFILES="$(cat -n $AUDIODIR/audiofiles.txt)"
echo " - Audio File(s) - "
echo " MuxIt found ($AUDFILZ) Audio Files."
echo " Audio File(s) Found Listed Below"
echo "$AUDFILES"
GETALANG="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $AUDIODIR/getslang.txt)"
$GETALANG
echo " Language(s) Per Audio File(s) Below"
SHOWLANG="$(cat -n $AUDIODIR/getslang.txt)"
echo "$SHOWLANG"
echo ""
################
### Audio End

echo "------------------"

## Audio Track Extra Start
################

AUDTONE="$(head -1 $AUDIODIR/audiofiles.txt)"
echo "$AUDTONE"
ALANGONE="$(head -1 $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d ".")"
echo "$ALANGONE"

################
## Audio Track Extra End
### MKV Mux
if [ "$FORMAT" == "aac" ]; then
 IFAAC="--aac-is-sbr 0"
else
 IFAAC=""
fi
cd $DONE
FORMAT="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-3)')"
$MKVMERGE -o $TITLE.mkv --default-duration 0:$MKVFPS --chapters $CHAPTERS  $VIDDIR/$VIDTOMUX\
           --language 0:$ALANGONE $IFAAC $AUDIODIR/$AUDTONE
rm $AUDIODIR/$AUDTONE
echo " Done Audio and Video Merged.. "
echo ""

###############
###############
# Subtitle Merge Loop for MultiTracks
##############

###############
# Subtitle Merge Loop for MultiTracks
##############
##############
submkvmerge ()
{
cd $SUBDIR
# TITLE
TITLESUB="$TITLE"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLESUB
case $TITLESUB in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLESUB ;;
	n|no)
		TITLESUB="$TITLE" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLESUB"
echo ""
sleep 2
ls *.idx > subtitles.txt
SUBFILES=$(cat -n subtitles.txt)
$SUBFILES
echo " - Subtitle Found - "
GETSLANG="$(cat $SUBDIR/subtitles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $SUBDIR/getslang.txt)"
$GETSLANG
## Audio Track Extra Start
################

SUBTONE="$(head -1 $SUBDIR/subtitles.txt)"
echo "$AUDTONE"
SLANGONE="$(head -1 $SUBDIR/getslang.txt)"
echo "$SLANGONE"

### MKV Mux
cd $DONE
$MKVMERGE -o $TITLESUB.mkv $TITLE.mkv --language 0:$SLANGONE --default-track 0:0 $SUBDIR/$SUBTONE
rm $TITLE.mkv
#rm $SUBDIR/$SUBTONE
echo " Done Audio and Video Merged.. "
echo ""

###############
###############
##
echo "What would you like to do?"
echo "A) Merge Another SubTitles"
echo "B) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) submkvmerge ;;
        "b" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B"
                exit 1
                ;;
esac
echo " "

}
###############
###############
# Audio Merge Loop for MultiTracks
##############
audiomkvmerge ()
{
cd $AUDIODIR
# TITLE
TITLENEW="$TITLE"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLENEW
case $TITLENEW in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLENEW ;;
	n|no)
		TITLENEW="$TITLENEW" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLENEW"
echo ""
sleep 2
cd $AUDIODIR
ls *.a* > $AUDIODIR/audiofiles.txt
GETALANG="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $AUDIODIR/getalang.txt)"
$GETALANG
## Audio Track Extra Start
################

AUDTONE="$(head -1 $AUDIODIR/audiofiles.txt)"
echo "$AUDTONE"
ALANGONE="$(head -1 $AUDIODIR/getalang.txt)"
echo "$ALANGONE"

################
## Audio Track Extra End

### MKV Mux
if [ "$FORMAT" == "aac" ]; then
 IFAAC="--aac-is-sbr 0"
else
 IFAAC=""
fi
cd $DONE
FORMAT="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-3)')"
$MKVMERGE -o $TITLENEW.mkv $TITLE.mkv --language 0:$ALANGONE $IFAAC $AUDIODIR/$AUDTONE

rm $TITLE.mkv
rm $AUDIODIR/$AUDTONE
mv $TITLENEW.mkv $TITLE.mkv
echo " Done Audio and Video Merged.. "
echo ""

###############
###############
##
echo "What would you like to do?"
echo "A) Audio Merge - for MultiTracks"
echo "B) Go to SubTitles - Use for Subtitle Merge"
echo "C) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) audiomkvmerge ;;
        "b" ) submkvmerge ;;
        "c" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C"
                exit 1
                ;;
esac
echo " "
}

# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " DVDre V. $VER"
echo "!!!!!!!!!!!!!!!!!!"

exit 0

}
###############
###############
##
echo "What would you like to do?"
echo "A) Audio Merge - for MultiTracks"
echo "B) Go to SubTitles - Use for Subtitle Merge"
echo "C) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) audiomkvmerge ;;
        "b" ) submkvmerge ;;
        "c" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C"
                exit 1
                ;;
esac
echo " "

################
## Audio Track Extra End

################
### MKV Mux END

}
# Mux MP4
muxmp4 ()
{
### Video Start
################
cd $VIDDIR
echo ""
echo " Mux to MP4 "
echo " MuxIt V. $VER"
echo ""
sleep 1
echo ""

# 264 to Mux
VIDTOMUX=$(ls | grep *.264)
echo " 264 File to Mux" 
echo " $VIDTOMUX"

# TITLE
TITLE="$VIDTOMUX"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLE
case $TITLE in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLE ;;
	n|no)
		TITLE="$VIDTOMUX" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLE"
echo ""
sleep 2

### FPS Start
################
# Clean First
if [ -e $VIDDIR/fps.txt ]; then
  rm $VIDDIR/fps.txt
fi
$MEDIAINFO $VIDDIR/$VIDTOMUX | grep fps | cut -f 2 -d ":" | cut -f 1 -d "f" | tr -d " " | tail -1 > fps.txt
MP4FPS=$(cat fps.txt)
if [ $MP4FPS = "29.970" ]; then
      MP4FPS="29.97"
elif [ $MP4FPS = "25.000" ]; then
      MP4FPS="25"
elif [ $MP4FPS = "24.000" ]; then
      MP4FPS="24"
elif [ $MP4FPS = "23.976" ]; then
      MP4FPS="23.976"
fi
echo " FPS FOUND: $MP4FPS"
echo ""
echo "------------------"
################
### FPS End
################
### Video End

### Audio Start
################
cd $AUDIODIR
LISTAUDIO=$(ls | grep "*.a*")
if [ "$LISTAUDIO" == "*.ac3" ];then
    LISTAUDIO=$(ls *.ac3 >> $AUDIODIR/audiofiles.txt)
elif [ "$LISTAUDIO" == "*.aac" ];then
    LISTAUDIO=$(ls *.aac >> $AUDIODIR/audiofiles.txt)
elif [ "$LISTAUDIO" != "*.a*" ];then
    LISTAUDIO=$(ls *.dts >> $AUDIODIR/audiofiles.txt)
fi 
AUDFILZ="$(cat -n $AUDIODIR/audiofiles.txt | tail -1 | awk '{print $1}')"
AUDFILES="$(cat -n $AUDIODIR/audiofiles.txt)"
echo " - Audio File(s) - "
echo " MuxIt found ($AUDFILZ) Audio Files."
echo " Audio File(s) Found Listed Below"
echo "$AUDFILES"
GETALANG="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $AUDIODIR/getalang.txt)"
$GETALANG
echo " Language(s) Per Audio File(s) Below"
SHOWLANG="$(cat -n $AUDIODIR/getalang.txt)"
echo "$SHOWLANG"
echo ""
################
### Audio End

echo "------------------"

## Audio Track Extra Start
################

AUDTONE="$(head -1 $AUDIODIR/audiofiles.txt)"
echo "$AUDTONE"
ALANGONE="$(head -1 $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d ".")"
echo "$ALANGONE"

################
## Audio Track Extra End

### MP4 Mux Start
################
echo ""
cd $DONE
$MP4BOX -fps $MP4FPS -chap $CHAPTERS\
       -add $VIDDIR/$VIDTOMUX\
       -add $AUDIODIR/$AUDTONE:lang=$ALANGONE  $DONE/$TITLE.mp4

#################
#################
rm $AUDIODIR/$AUDTONE
echo " Done Audio and Video Merged.. "
echo ""

### MP$ Sub Extra Start
###############
###############
submp4merge ()
{
cd $SUBDIR
# TITLE
TITLESUB="$TITLE"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLESUB
case $TITLESUB in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLESUB ;;
	n|no)
		TITLESUB="$TITLE" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLESUB"
echo ""
sleep 2
ls *.idx > subtitles.txt
SUBFILES=$(cat -n subtitles.txt)
$SUBFILES
echo " - Subtitle Found - "
GETSLANG="$(cat $SUBDIR/subtitles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $SUBDIR/getslang.txt)"
$GETSLANG
## Audio Track Extra Start
################

SUBTONE="$(head -1 $SUBDIR/subtitles.txt)"
echo "$AUDTONE"
SLANGONE="$(head -1 $SUBDIR/getslang.txt)"
echo "$SLANGONE"

### MKV Mux
cd $DONE
echo ""
cd $DONE
$MP4BOX -add $TITLE.mp4 -add $SUBDIR/$SUBTONE:lang=$SLANGONE  $DONE/$TITLENEW.mp4
rm $TITLE.mp4
#rm $SUBDIR/$SUBTONE
echo " Done Audio and Video Merged.. "
echo ""

###############
###############
##
echo "What would you like to do?"
echo "A) Merge Another SubTitles"
echo "B) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) submp4merge ;;
        "b" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B"
                exit 1
                ;;
esac
echo " "

}
###############
###############
### MP4 Sub Extra End

###############
###############
# Audio Merge Loop for MultiTracks
##############
audiomp4merge ()
{
cd $AUDIODIR
# TITLE
TITLENEW="$TITLE"
echo ""
echo " Title Name: $TITLE"
echo " Tip: MultiAudioTracks. wait till last audio"
echo "  Track or Last Subtitle Track is Muxed to Give a Final Title."
echo "name Your MKV File For Saving"
echo "Change The Title Name? : (Press y/n)"
echo "-----------------------------------"
read TITLENEW
case $TITLENEW in
	y|yes)
	  echo "Enter Title Name: "
          echo "------------------"
	   	read TITLENEW ;;
	n|no)
		TITLENEW="$TITLENEW" ;;
	*)
	echo "Error Valid Choices are y|n"
	exit 1 ;;
    esac
echo ""
echo "Title: $TITLENEW"
echo ""
sleep 2
cd $AUDIODIR
ls *.a* > $AUDIODIR/audiofiles.txt
GETALANG="$(cat $AUDIODIR/audiofiles.txt | perl -lne 'print substr($_,-6)' | cut -f 1 -d "." > $AUDIODIR/getalang.txt)"
$GETALANG
## Audio Track Extra Start
################

AUDTONE="$(head -1 $AUDIODIR/audiofiles.txt)"
echo "$AUDTONE"
ALANGONE="$(head -1 $AUDIODIR/getalang.txt)"
echo "$ALANGONE"

################
## Audio Track Extra End

### MKV Mux
#$MKVMERGE -o $TITLENEW.mkv $TITLE.mkv --language 0:$ALANGONE --aac-is-sbr 0 $AUDIODIR/$AUDTONE
echo ""
cd $DONE
$MP4BOX -add $TITLE.mp4 -add $AUDIODIR/$AUDTONE:lang=$ALANGONE  $DONE/$TITLENEW.mp4
rm $TITLE.mp4
rm $AUDIODIR/$AUDTONE
mv $TITLENEW.mp4 $TITLE.mp4
echo " Done Audio and Video Merged.. "
echo ""

###############
###############
##
echo "What would you like to do?"
echo "A) Audio Merge - for MultiTracks"
echo "B) Go to SubTitles - Use for Subtitle Merge"
echo "C) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) audiomp4merge ;;
        "b" ) submp4merge ;;
        "c" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C"
                exit 1
                ;;
esac
echo " "
}

# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " DVDre V. $VER"
echo "!!!!!!!!!!!!!!!!!!"

exit 0

}
###############
###############
##
echo "What would you like to do?"
echo "A) Audio Merge - for MultiTracks"
echo "B) Go to SubTitles - Use for Subtitle Merge"
echo "C) Quit... Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) audiomp4merge ;;
        "b" ) submp4merge ;;
        "c" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C"
                exit 1
                ;;
esac
echo " "

################
## Audio Track Extra End

################
################
### MP4 Mux END

}
# Quit
goodbye ()
{
echo "!!!!!!!!!!!!!!!!!!"
echo " OK.. Bye Now.."
echo " Thanx for Using.."
echo " MuxIt V. $VER"
echo "!!!!!!!!!!!!!!!!!!"

exit 0

}
########
########
#
############################
############################
## END  MKV|MP4 Questions ##
############################
############################

############################
############################
### START MUXIT QUESTION ###
############################
############################
#

echo ""
echo "What would you like to do?"
echo "A) Mux Files to MKV - Matroska"
echo "B) Mux Files to MP4 - MP4Box"
echo "C) Quit - Back to DvDre"
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C"
echo " Choice a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) muxmkv ;;
        "b" ) muxmp4 ;;
        "c" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C"
                exit 1
                ;;
esac
echo " "

#
############################
############################
###  END MUXIT QUESTION  ###
############################
############################

