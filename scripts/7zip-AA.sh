#!/bin/sh
#
# 7ip Archive Assistant Script
#   Archieve Using 7zip
#     Password Optional
#
# http://script.m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD
# projects - @ - 0tue0 (dot) com
##
# Bash Program to add in 7zip Archiving
#  Handles Passwords, Compressions Switches, and Various Formats
#
########################################################
########################################################
##         7ip Archive Assistant Script               ##
########################################################
########################################################
##                 No Password                        ##
########################################################
########################################################
nopassword ()
{
# Path to Date
DATE="/bin/date"
# Date Format
DATE2=`$DATE '+%m-%d'-%Y`

#
# Path to Working Directory
WORK="changeme"

sleep 1
# Change Directory Path
echo "####################################"
echo "#   This has to be a Direct Path   #"
echo "#      EXAMPLE:                    #"
echo "#               /home/me/archive   #"
echo "####################################"
echo ""
echo "Working Path: $WORK"
echo ""
echo "###########################################"
echo "# Change Working Directory? : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
	y|yes)
	  echo "########################################"
	  echo "# Enter Path to Working Directory:     #"
	  echo "########################################"
	   	read WORK ;;
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
echo "#####################################################################"
echo "# Compression Switch                                                #"
echo "# Default is set @ 3                                                #"
echo "# Choose Switch                                                     #"
echo "# Choose From 0, 3, 5, 7, 9                                         #"
echo "# 0 = Don't Compress at all Is called "copy mode" and "fastest."    #"
echo "# 3 = Fast Compression Will set various parameters automatically.   #"
echo "# 5 = Same as above, but "normal.                                   #"
echo "# 7 = "maximum" compression.                                        #"
echo "# 9 = "ultra" compression. You probably want to use this.           #"
echo "#####################################################################"
#
COM="0"

echo "###########################################"
echo "# Default is set to 0 - No Compression"   #"
echo "#     Switch: $COM"                       #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
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
echo "#################################################"
echo "# 7z          archive.7z (default option)       #"
echo "# gzip        archive.gzip - archive.gz         #"
echo "# zip          archive.zip (very compatible)    #"
echo "# bzip2       archive.bzip2                     #"
echo "# tar          tarball.tar (UNIX and Linux)     #"
echo "# iso          image.iso                        #"
echo "# udf          disk.udf                         #"
echo "#################################################"
#
TYPE="7z"

echo "###########################################"
echo "#  Default is set to 7z                   #"
echo "# Compression Type: $TYPE                 #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
	y|yes)
	  echo "###############################"
	  echo "# Enter a Compression Number: #"
	  echo "###############################"
	   	read TYPE ;;
	n|no)
		echo ;;
	*)
	echo "%%%%%%%%%%%%%%%%%%%"
	echo "%   Error Sorry?  %"
	echo "%%%%%%%%%%%%%%%%%%%"
	exit 1 ;;
    esac
echo ""
echo "$TYPE"
#
# Echo of Choices
echo "##########################################"
echo "#      A List of Your Choices            #"
echo "#  Working Path: $WORK                   #"
echo "#  Compression Switch: $COM              #"
echo "#  Compression Type: $TYPE               #"
echo "##########################################"
#
#
echo " Archive Now Starting "
sleep 1
cd $WORK
# Search & Archive Directory
for file in *
do
if [[ -d $file ]]
then
7za a -t$TYPE $file-$DATE2.$TYPE $file -mx$COM
fi
echo" Done......."
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
# Path to Date
DATE="/bin/date"
# Date Format
DATE2=`$DATE '+%m-%d'-%Y`

#
# Path to Working Directory
WORK="changeme"

sleep 1
# Change Directory Path
echo "####################################"
echo "#   This has to be a Direct Path   #"
echo "#      EXAMPLE:                    #"
echo "#               /home/me/archive   #"
echo "####################################"
echo ""
echo "Working Path: $WORK"
echo ""
echo "###########################################"
echo "# Change Working Directory? : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
	y|yes)
	  echo "########################################"
	  echo "# Enter Path to Working Directory:     #"
	  echo "########################################"
	   	read WORK ;;
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
echo "#####################################################################"
echo "# Compression Switch                                                #"
echo "# Default is set @ 3                                                #"
echo "# Choose Switch                                                     #"
echo "# Choose From 0, 3, 5, 7, 9                                         #"
echo "# 0 = Don't Compress at all Is called "copy mode" and "fastest."    #"
echo "# 3 = Fast Compression Will set various parameters automatically.   #"
echo "# 5 = Same as above, but "normal.                                   #"
echo "# 7 = "maximum" compression.                                        #"
echo "# 9 = "ultra" compression. You probably want to use this.           #"
echo "#####################################################################"
#
COM="0"

echo "###########################################"
echo "# Default is set to 0 - No Compression"   #"
echo "#     Switch: $COM"                       #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
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
echo "#################################################"
echo "# 7z          archive.7z (default option)       #"
echo "# gzip        archive.gzip - archive.gz         #"
echo "# zip          archive.zip (very compatible)    #"
echo "# bzip2       archive.bzip2                     #"
echo "# tar          tarball.tar (UNIX and Linux)     #"
echo "# iso          image.iso                        #"
echo "# udf          disk.udf                         #"
echo "#################################################"
#
TYPE="7z"

echo "###########################################"
echo "#  Default is set to 7z                   #"
echo "# Compression Type: $TYPE                 #"
echo "#                                         #"
echo "###########################################"
echo "# Change Compression Switch : (Press y/n) #"
echo "###########################################"
read CHANGE

case $CHANGE in
	y|yes)
	  echo "###############################"
	  echo "# Enter a Compression Number: #"
	  echo "###############################"
	   	read TYPE ;;
	n|no)
		echo ;;
	*)
	echo "%%%%%%%%%%%%%%%%%%%"
	echo "%   Error Sorry?  %"
	echo "%%%%%%%%%%%%%%%%%%%"
	exit 1 ;;
    esac
echo ""
echo "$TYPE"
#
# Password Area
PW="1234"
sleep 1
echo "########################################"
echo "#  Default is set to 1234              #"
echo "# Password: $PW                        #"
echo "#                                      #"
echo "########################################"
echo "# Change Password :  (Press y/n)       #"
echo "########################################"
read CHANGE

case $CHANGE in
	y|yes)
	  echo "###############################"
	  echo "# Enter a Compression Number: #"
	  echo "###############################"
	   	read PW ;;
	n|no)
		echo ;;
	*)
	echo "%%%%%%%%%%%%%%%%%%%"
	echo "%   Error Sorry?  %"
	echo "%%%%%%%%%%%%%%%%%%%"
	exit 1 ;;
    esac
echo ""
echo "$PW"
#
sleep 1
# Echo of Choices
echo "###########################################"
echo "       A List of Your Choices             #"
echo "#  Working Path: $WORK                    #"
echo "#  Compression Switch: $COM               #"
echo "#  Compression Type: $TYPE                #"
echo "#  Password: $PW                          #"
echo "###########################################"
#
echo " Starting Passworded Archiving Now "
sleep 1
cd $WORK
# Search & Archieve Directory
for file in *
do
if [[ -d $file ]]
then
7za a -t$TYPE $file-Passworded-$DATE2.$TYPE $file -mx$COM -p$PW
fi
echo" Done......."
echo " $file-Passworded-$DATE2.$TYPE has password: $PWD "
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
                echo " Try Again"
                exit 1 ;;
        esac
exit 0
