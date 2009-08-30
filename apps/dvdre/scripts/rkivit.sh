#!/bin/sh
# rKiv It
VER="0.2"
# 
# rKiv It is a 7zip archiving script,
#  to use with DvDre.
# Archive's per size and optional passworded.
#
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
#################################
# LINKS
###########################
# rKiv It depends on the following
# <a href="http://www.7-zip.org/download.html">7-Zip</a>
#
###########################
#      Also See ...
# <a href="http://script.m-redd.com/dvdre.htm">DvDre Script</a>
# <a href="http://script.m-redd.com/mi-nfocreate.htm">MI nfoCreate Script</a>
# <a href="http://script.m-redd.com/imdb-dump.htm">iMDB-Dump Script</a>
# <a href="http://script.m-redd.com/imdb-thumbgrab.htm">iMDB-ThumbGrab Script</a>
# <a href="http://script.m-redd.com/vidrip.htm">DVD VidRip</a>
# <a href="http://script.m-redd.com/videnc.htm">DVD VidEnc</a>
# <a href="http://script.m-redd.com/muxit.htm">DVD MuxIt</a>
# <a href="http://script.m-redd.com/audiorip.htm">DVD Audio Rip</a>
# <a href="http://script.m-redd.com/subrip.htm">DVD Subtitle Rip</a>
#
############################
echo "rKiv It V. $VER"
############################
#
### Path to Applications
SEVENZA="/usr/bin/7za"
### Path to DvDre Directories
DVDRE="$HOME/apps/dvdre"
#
### Start No Password
############################
nopassword ()
{
############################
echo "rKiv It V. $VER"
############################
# Path to Date
DATE="/bin/date"
# Date Format
DATE2=`$DATE '+%m-%d'-%Y`
TYPE="7z"
#
### Path to Done Folder
###############
DONE="$DVDRE/rip/done"
cd $DONE
sleep 1
LSDONE="$(ls $DONE)"
echo " rKiv It will now help you Compress, "
echo " $LSDONE "
#
sleep 1
echo "###########################################"
echo "# Split The File?                         #"
echo "# Default is set to single file           #"
echo "#                                         #"
echo "# Tell 7-Zip the Volume Size to Split     #"
echo "#   Example:                              #"
echo "#     1200b will result in 1200B          #"
echo "#     1000k will result in 1000Kb         #"
echo "#     50m will result in 50 Mb files      #"
echo "#     2g will result in 250 Gb files      #"
echo "###########################################"
echo "# Change Split Size : (Press y/n)         #"
echo "###########################################"
read AFSIZE

case $AFSIZE in
        y|yes)
          echo "##########################################"
          echo "# Enter  Desired  Size:                  #"
          echo "# be sure to add b, k, m, g at the end #"
          echo "##########################################"
                read AFSIZE ;;
        n|no)
                AFSIZE="" ;;
        *)
        echo "%%%%%%%%%%%%%%%%%%%"
        echo "%   Error Sorry?  %"
        echo "%%%%%%%%%%%%%%%%%%%"
        exit 1 ;;
    esac
echo ""
# File Size - Single and Multi File(s) fix
if [ "$AFSIZE" == "" ];then
      FASIZE=""
else
      FASIZE="$AFSIZE"
fi
#
if [ "$FASIZE" == "" ];then
    FASIZE='File Size: (Single File)' ; echo "$FASIZE"
else
    echo "File(s) Split at: $FASIZE"
fi
#
sleep 1
echo "#####################################################################"
echo "# Compression Switch                                                #"
echo "# Default is set @ 3                                                #"
echo "# Choose Switch                                                     #"
echo "# Choose From 0, 3, 5, 7, 9                                         #"
echo "# 0 = Don't Compress at all Is called copy mode and fastest.        #"
echo "# 3 = Fast Compression Will set various parameters automatically.   #"
echo "# 5 = Same as above, but normal.                                    #"
echo "# 7 = maximum compression.                                          #"
echo "# 9 = ultra compression. You probably want to use this.             #"
echo "#####################################################################"
#
COM="0"

echo "###########################################"
echo "# Default is set to 0 - No Compression    #"
echo "#     Switch: $COM                       #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read COM

case $COM in
        y|yes)
          echo "###############################"
          echo "# Enter a Compression Number: #"
          echo "###############################"
                read COM ;;
        n|no)
                echo ;;
        *)
        echo "%%%%%%%%%%%%%%%%%%%"
        echo "%   Error Sorry?  %"
        echo "%%%%%%%%%%%%%%%%%%%"
        exit 1 ;;
    esac
echo ""
#
sleep 1
# Echo of Choices
echo "##########################################"
echo "#      A List of Your Choices            #"
echo "#  Working Path: $WORK                   #"
echo "#  Compression Switch: $COM              #"
echo "#  Compression Type: $TYPE               #"
echo "#  Split Size: $FASIZE                   #"
echo "##########################################"
#
#
echo " Archive Now Starting "
sleep 1
cd $DONE
for file in *
do
if [[ -d $file ]]
then
      if [ "$FASIZE" == "File Size: (Single File)" ]; then
        $SEVENZA a -t$TYPE $file-$DATE2.$TYPE $file -mx$COM
  else
        $SEVENZA a -t$TYPE -v$FASIZE $file-$DATE2.$TYPE $file -mx$COM
  fi
fi
echo " Done......."
echo " $file-$DATE2.$TYPE Completed"
echo ""
done
}

########################################################
########################################################
##         7ip Archive Assistant Script               ##
########################################################
########################################################
########################################################
##                    Password                        ##
########################################################
########################################################
password ()
{
############################
echo "rKiv It V. $VER"
############################
# Path to Date
DATE="/bin/date"
# Date Format
DATE2=`$DATE '+%m-%d'-%Y`
TYPE="7z"
#
### Path to Done Folder
###############
DONE="$DVDRE/rip/done"
cd $DONE
sleep 1
LSDONE="$(ls $DONE)"
echo " rKiv It will now help you Compress, "
echo " $LSDONE "
#
#
sleep 1
echo "###########################################"
echo "# Split The File?                         #"
echo "# Default is set to single file           #"
echo "#                                         #"
echo "# Tell 7-Zip the Volume Size to Split     #"
echo "#   Example:                              #"
echo "#     1200b will result in 1200B          #"
echo "#     1000k will result in 1000Kb         #"
echo "#     50m will result in 50 Mb files      #"
echo "#     2g will result in 250 Gb files      #"
echo "###########################################"
echo "# Change Split Size : (Press y/n)         #"
echo "###########################################"
read AFSIZE

case $AFSIZE in
        y|yes)
          echo "##########################################"
          echo "# Enter  Desired  Size:                  #"
          echo "# be sure to add b, k, m, g at the end #"
          echo "##########################################"
                read AFSIZE ;;
        n|no)
                AFSIZE="" ;;
        *)
        echo "%%%%%%%%%%%%%%%%%%%"
        echo "%   Error Sorry?  %"
        echo "%%%%%%%%%%%%%%%%%%%"
        exit 1 ;;
    esac
echo ""
# File Size - Single and Multi File(s) fix
if [ "$AFSIZE" == "" ];then
      FASIZE=""
else
      FASIZE="$AFSIZE"
fi
#
if [ "$FASIZE" == "" ];then
    FASIZE='File Size: (Single File)' ; echo "$FASIZE"
else
    echo "File(s) Split at: $FASIZE"
fi
#
sleep 1
echo "#####################################################################"
echo "# Compression Switch                                                #"
echo "# Default is set @ 3                                                #"
echo "# Choose Switch                                                     #"
echo "# Choose From 0, 3, 5, 7, 9                                         #"
echo "# 0 = Don't Compress at all Is called copy mode and fastest.        #"
echo "# 3 = Fast Compression Will set various parameters automatically.   #"
echo "# 5 = Same as above, but normal.                                    #"
echo "# 7 = maximum compression.                                          #"
echo "# 9 = ultra compression. You probably want to use this.             #"
echo "#####################################################################"
#
COM="0"

echo "###########################################"
echo "# Default is set to 0 - No Compression    #"
echo "#     Switch: $COM                       #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read COM

case $COM in
        y|yes)
          echo "###############################"
          echo "# Enter a Compression Number: #"
          echo "###############################"
                read COM ;;
        n|no)
                echo ;;
        *)
        echo "%%%%%%%%%%%%%%%%%%%"
        echo "%   Error Sorry?  %"
        echo "%%%%%%%%%%%%%%%%%%%"
        exit 1 ;;
    esac
echo ""
#
sleep 1
#
# Password Area
PASSWD="4321dvdre"
sleep 1
echo "########################################"
echo "#  Default is set to 4321dvdre         #"
echo "# Password: $PASSWD                    #"
echo "#                                      #"
echo "########################################"
echo "# Change Password :  (Press y/n)       #"
echo "########################################"
read PASSWD

case $PASSWD in
        y|yes)
          echo "###################################"
          echo "# Enter a Password for Your File: #"
          echo "###################################"
                read PASSWD ;;
        n|no)
                PASSWD="4321dvdre" ;;
        *)
        echo "%%%%%%%%%%%%%%%%%%%"
        echo "%   Error Sorry?  %"
        echo "%%%%%%%%%%%%%%%%%%%"
        exit 1 ;;
    esac
echo ""
#
sleep 1
# Echo of Choices
echo "###########################################"
echo "#      A List of Your Choices             #"
echo "#  Working Path: $DONE                    #"
echo "#  Compression Switch: $COM               #"
echo "#  Compression Type: $TYPE                #"
echo "#  Password: $PASSWD                      #"
echo "#  Split Size: $FASIZE                    #"
echo "###########################################"
#
echo " Starting Passworded Archiving Now "
sleep 1
echo " Archive Now Starting "
sleep 1
cd $DONE

for file in *
do
if [[ -d $file ]]
then
      if [ "$FASIZE" == "File Size: (Single File)" ]; then
        $SEVENZA a -t$TYPE $file-Passworded-$DATE2.$TYPE $file -mx$COM -p$PASSWD
  else
        $SEVENZA a -t$TYPE -v$FASIZE $file-Passworded-$DATE2.$TYPE $file -mx$COM -p$PASSWD
  fi
fi
echo " Done......."
echo " $file-Passworded-$DATE2.$TYPE has password: $PASSWD "
echo ""
done
}

########################################################
########################################################
##         7ip Archive Assistant Script               ##
########################################################
########################################################
sleep 1
echo "######################################"
echo "## Starting........................ ##"
echo "## 7zip Archive Assistant Starting  ##"
echo "##     Choose From                  ##"
echo "##        No Password or Password   ##"
echo "######################################"

 case "$1" in
        nopassword)
            NoPassword
                ;;
        password)
            Password
                ;;
        *) echo
           echo "##############################"
           echo "Choose NoPassword or Password" ;;
    esac
echo "##################"    
echo " 1) NoPassword "
echo " 2) Password "
echo "##################"
echo " "

read CHOICE

        case "$CHOICE" in
        "1" ) nopassword ;;
        "2" ) password ;;
        *)
                echo " Sorry Error?"
                echo " Valid Entry is 1, or 2"
                exit 1 ;;
        esac
exit 0

