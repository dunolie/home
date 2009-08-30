#!/bin/bash
# DvDre
VER="0.1.10"
# a script to aid the use of the many script's
# i've created to backup - rip/encode dvd's 
# in Full DVDR and Matroska .mkv or MPEG4 .mp4.
# Grab Multi Audio|Subtitle Tracks
# also fetching IMDb Info and thumbnails if 
# available. the end result will package it in 
#  a 7-Zip .7z archive.
# --Script in Process--
# will offer an installer
#  package when complete.
#----------------------
#  
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# DvDre Rip/Encode High Qaulity MKV or MP4 Files
#
# <a href="http://dvdbackup.sourceforge.net/">DVDBackup</a>           
# <a href="http://www.mplayerhq.hu/design7/dload.html">MPlayer - MEncoder</a>
# <a href="http://www.bunkus.org/videotools/ogmtools/">DvDxChap - OGMTools</a> 
# <a href="http://tcforge.berlios.de/">Transcode</a>
# <a href="http://mediainfo.sourceforge.net/en">MediaInfo</a>
# <a href="http://untrepid.com/acidrip/lsdvd.html">lsdvd</a>
# <a href="http://http://www.7-zip.org/download.html">7-Zip</a>
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
# <a href="http://script.m-redd.com/subrip.htm">DVD Subtitle Rip</a>
# <a href="http://script.m-redd.com/rkivit.htm">rKiv It - 7-Zip the finished folder</a>
#

############################
############################
#####  SCRIPTS  PATH   #####
############################
############################
#
DVDRE="$HOME/apps/dvdre"
# Path to Script Folder
SFLDR="$DVDRE/scripts"
# Path to VidRip
VIDRIP="$SFLDR/vidrip.sh"
# Path to VidEnc
VIDENC="$SFLDR/videnc.sh"
# Path to AudioRip
AUDIORIP="$SFLDR/audiorip.sh"
# Path to SubRip
SUBRIP="$SFLDR/subrip.sh"
# Path to MuxIt
MUXIT="$SFLDR/muxit.sh"
# Path to MI nfoCreate
MINFOCREATE="$SFLDR/mi-nfocreate.sh"
# Path to iMBD Dump
IMDBD="$SFLDR/imdb-dump.sh"
# Path to iMBD ThumbGrab
IMBDTG="$SFLDR/imdb-thumbgrab.sh"
# Path to rKiv It
RKIVIT="$SFLDR/rkivit.sh"
#
LOGS="$DVDRE/logs"
#
############################
############################
####  END SCRIPTS PATH  ####
############################
############################
cd $LOGS
if [ -e $LOGS ]; then
  rm $LOGS/*.log
fi
# Start Loop
while true
do
############################
############################
#####   START DvDre    #####
############################
############################


########
########
# Rip DVDR
ripdvdrorvob ()
{
echo "VidRip to DVDR or vob"
sleep 2
$VIDRIP

}
# Encode
encdvd ()
{
echo " VidEnc DVD or vob"
sleep 2
$VIDENC

}
# Rip Audio
ripdvdaudio ()
{
echo " AudioRip From DVD and Optional AAC Conversion"
sleep 2
$AUDIORIP

}
# Rip Subtitle
ripdvdsub ()
{
echo " SubRip from DVD needs IFO File"
sleep 2
$SUBRIP

}
# Rip Subtitle
muxit ()
{
echo " MuxIt from DVD MKV|MP4 Video|Audio|Subtitle Muxing"
sleep 2
$MUXIT

}
# MI nfo Create
micreate ()
{
echo " MI nfoCreate"
sleep 2
$MINFOCREATE

}
# iMDB Dump
dumpttd ()
{
echo ""
echo "!!!!!!!!!!!!!!!!!!"
echo " iMDB Dump - the info dumper"
echo " You will need a ttcode for this to work"
echo " From: http://imdb.com"
echo " Example: The Evil Dead http://www.imdb.com/title/tt0083907"
echo "  You would use tt0083907"
echo "!!!!!!!!!!!!!!!!!!"
echo ""
echo " Type in Code Number Now"
echo "-------------------------"
read TTCODE

$IMDBD $TTCODE

echo ""

}
# iMDB ThumbGrab
dumptttg ()
{
echo ""
echo "!!!!!!!!!!!!!!!!!!"
echo " iMDB ThumbGrab - the image dumper"
echo " You will need a ttcode for this to work"
echo " From: http://imdb.com"
echo " Example: The Evil Dead http://www.imdb.com/title/tt0083907"
echo "  You would use tt0083907"
echo "!!!!!!!!!!!!!!!!!!"
echo ""
echo " Type in Code Number Now"
echo "-------------------------"
read TTCODE

$IMBDTG $TTCODE

echo ""

}
# Archive The Ripped Film Folder
rkivit ()
{
echo " rKiv It - 7-Zip Your Finished Film Folder"
sleep 2
$RKIVIT

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
########
########

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "%% DvDre Script V. $VER                     %%"
echo "%% Rip|Encode DVD|Video_TS|VOB|ISO|IMG       %%"
echo "%% with and added IMBd info|thumbnail Dump   %%"
echo "%% to .nfo|.htm - Follow Menu for Options    %%"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo ""
echo "What would you like to do?"
echo "A) VidRip DVD to HardDisc|DVDR - VOBRip"
echo "B) VidEnc - Encode from DVD or VOB"
echo "C) AudioRip - Audio Ripper"
echo "D) SubRip - Subtitle Ripper"
echo "E) MuxIt - Mux Video|Audio|Subtitles to MKV|MP4"
echo "F) MI nfoCreate - Create Custom nfo|htm metadata Files"
echo "G) iMDB Dump - Dump Film Info to Shell"
echo "H) iMDB ThumbGrab - Grab iMDB ThumbNails"
echo "I) rKiv It - 7-Zip the Finished File(s), Folder"
echo "J) Quit Script.."
echo " "
echo "-------------------------"
echo "Valid Choices are LowerCase A,B,C,D,E,F,G,H,I,J"
echo " Chose a Letter hit Enter"
echo "-------------------------"
read CHOICE

case $CHOICE in
        "a" ) ripdvdrorvob ;;
        "b" ) encdvd ;;
        "c" ) ripdvdaudio ;;
        "d" ) ripdvdsub ;;
        "e" ) muxit ;;
        "f" ) micreate ;;
        "g" ) dumpttd ;;
        "h" ) dumptttg ;;
        "i" ) rkivit ;;
        "j" ) goodbye ;;
          *)
                echo "Error - Valid Choices are A,B,C,D,E,F,G,H,I"
                exit 1
                ;;
esac
echo " "
############################
############################
#####    END  DvDre    #####
############################
############################

echo ""
echo "************************"
echo "************************"
echo " DVDre .. Done.."
echo " DVDre does infinite loop "
echo "  to allow multirips of Track"
echo "************************"
echo "************************"
echo ""
echo "************************"
echo " Just Press j then Enter to Quit.. "
echo " Thanx. Restarting Script Now.."
echo "************************"
echo ""
sleep 5

# End Start Loop
done

