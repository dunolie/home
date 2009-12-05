#!/bin/sh
# Custom System Info Script
# 0.1 Date Wed Mar 25 22:02:57 PDT 2009
# by: MreDD
#######
#
# Colors
# regular colors
K='\E[0;30m' # Black - Regular
R='\E[0;31m' # Red
G='\E[0;32m' # Green
Y='\E[0;93m' # Yellow
B='\E[0;34m' # Blue
P='\E[0;35m' # Purple
C='\E[0;36m' # Cyan
W='\E[0;37m' # White
O='\E[0;33m' # Orange
BK='\E[1;30m' # Black - Bold
BR='\E[1;31m' # Red
BG='\E[1;32m' # Green
BY='\E[1;93m' # Yellow
BB='\E[1;34m' # Blue
BP='\E[1;35m' # Purple
BC='\E[1;36m' # Cyan
BW='\E[1;37m' # White
BO='\E[1;33m' # Orange
UK='\E[4;30m' # Black - Underline
UR='\E[4;31m' # Red
UG='\E[4;32m' # Green
UW='\E[4;93m' # Yellow
UB='\E[4;34m' # Blue
UP='\E[4;35m' # Purple
UC='\E[4;36m' # Cyan
UW='\E[4;37m' # White
UO='\E[4;33m' # Orange
BGK='\E[40m'   # Black - Background
BGR='\E[41m'   # Red
BGG='\E[42m'   # Green
BGY='\E[93m'   # Yellow
BGB='\E[44m'   # Blue
BGP='\E[45m'   # Purple
BGC='\E[46m'   # Cyan
BGW='\E[47m'   # White
BGO='\E[33m'   # Orange
TR='\E[0m'    # Text Reset
# Variables
interface="eth0"
distro=$(cat /etc/arch-release)
name=$(uname -s)
hname=$(uname -n)
who=$(whoami)
hardware=$(uname -m)
cpuinfo=$(uname -p | awk '{print $1,$2,$3,$5,$6,$7}')
version=$(uname -v)
release=$(uname -r)
uptime=$(uptime | sed 's/,.*$//')
vidcard=$(lspci | grep VGA | awk '{print $5,$7,$8,$9$10}')
scrnrez=$(xrandr | grep 'current' | cut -c39-50)
ramall=$(free -m | grep "Mem:" | awk '{print $2}')
ramuse=$(free -m | grep "buffers/cache:" | awk '{print $3}')
netcard=$(lspci | grep "Ethernet" | awk '{print $4,$6,$7,$2}')
tvcarda=$(lspci | grep "Multimedia" | awk '{print $5,$8,$15}' | cut -f 1 -d "/")
tvcardb=$(lspci | grep "Multimedia" | awk '{print "/"$16,$10,$11"/"$17}')
soundcard=$(lspci | grep "Audio" | head -1 | awk '{print $4,$6,$9,$10,$11}')
raidcard=$(lspci | grep "RAID" | awk '{print $5,$7,$8,$9,$10}')
#tinetin=$(ifconfig $interface | grep "(" | cut -c31-38)
#tinetout=$(ifconfig $interface | grep "(" | cut -c60-65)
tinetin=$(ifconfig $interface | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
tinetout=$(ifconfig $interface | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
hd1=$(df -lh / | grep "/" | awk '{print $2"/"$1}' | tail -1)
#hd2=$(df -lh /usr | grep "usr" | awk '{p rint $2"/"$1}')
#hd3=$(df -lh /var | grep "var" | awk '{print $2"/"$1}')
hd4=$(df -lh /home | grep "home" | awk '{print $2"/"$1}')
hd5=$(df -lh /mnt/a | grep "a" | awk '{print $2"/"$1}' | tail -1)
hd6=$(df -lh /mnt/b | grep "b" | awk '{print $2"/"$1}' | tail -1)
hd7=$(df -lh /mnt/c | grep "c" | awk '{print $2"/"$3}' | tail -1)
mocnpa=$(/home/mredd/.wmii-hg/scripts/mocnpartist.sh)
mocnps=$(/home/mredd/.wmii-hg/scripts/mocnpsong.sh)
mocnpt=$(/home/mredd/.wmii-hg/scripts/mocnptime.sh)

#echo -e "${W}OS${K}: ${BW}$distro ${O}| ${TR}Up${K}: ${BW}$uptime "
#echo -e "${W}Sys${K}: ${BW}$name${O}/${BW}$hardware ${BW}$cpuinfo ${O}| ${TR}Krnl${K}: ${BW}$release "
#sleep 1
#echo -e "${W}Gfx${K}: ${BW}$vidcard ${O}| ${TR}Res${K}: ${BW}$scrnrez "
#echo -e "${W}Ram${K}: ${BW}$ramuse${O}/${BW}$ramall ${O}| ${TR}Keyboard${K}: ${BW}Logitech G11 "
#sleep 1
#echo -e "${W}Net${K}: ${BW}$netcard ${TR}In${K}: ${BW}$tinetin ${TR}Out${K}: ${BW}$tinetout "
#echo -e "${W}TVcard${K}: ${BW}$tvcard "
#sleep 1
#echo -e "${W}Soundcard${K}: ${BW}$soundcard "
#echo -e "${W}Raidcard${K}: ${BW}$raidcard "
#sleep 1
#echo -e "${W}Hdd${K}: ${BR}$hd1 ${O}- ${BB}$hd4 ${O}- ${BC}$hd5 ${O}- ${BG}$hd6 ${O}- ${BW}$hd7"

echo " "
echo -e "                   ${C}-. "
echo -e "                  ${C}.o+. "
echo -e "                 ${C}.ooo/ "
echo -e "                ${C}.+oooo: "
echo -e "               ${C}.+oooooo:    ${W}OS${K}: ${BW}$distro ${O}| ${TR}Up${K}: ${BW}$uptime "
echo -e "               ${C}-+oooooo+:    ${W}Sys${K}: ${BW}$name${O}/${BW}$hardware ${BW}$cpuinfo "
echo -e "             ${C}./:-:++oooo+:    ${W}Krnl${K}: ${BW}$release ${O}| ${TR}Ram${K}: ${BW}$ramuse${R}/${BW}$ramall "
echo -e "            ${C}./++++/+++++++:    ${W}Gfx${K}: ${BW}$vidcard ${O}| ${TR}Res${K}: ${BW}$scrnrez "
echo -e "           ${C}./++++++++++++++:    ${W}Net${K}: ${BW}$netcard "
echo -e "          ${C}./+++oooooooo${B}ooooo/.         ${TR}In${K}: ${BW}$tinetin ${TR}Out${K}: ${BW}$tinetout " 
echo -e "         ${B}./ooosssso++osssssso+.   ${W}TV${K}: ${BW}$tvcarda${tvcardb} " 
echo -e "        ${B}.oossssso-..../ossssss+.   ${W}Sound${K}: ${BW}$soundcard "
echo -e "       ${B}-osssssso.      :ssssssso.   ${W}Raid${K}: ${BW}$raidcard "
echo -e "      ${B}:osssssss/        osssso+++.   ${W}Hdd${K}: ${BR}$hd1 ${O}- ${BB}$hd4 ${O}- ${BC}$hd5 ${O}- ${BG}$hd6 ${O}- ${BW}$hd7"  
echo -e "     ${B}/ossssssss/        +ssssooo/-    ${W}Keyboard${K}: ${BW}Logitech ${R}G${O}11 ${TR}Mouse${K}: ${BW}Logitech Performance${R}MX"
echo -e "   ${B}./ossssso+/:-        -:/+osssso+-   ${W}WM${K}: ${BW}WMii${K}-${BW}hg ${O}| ${TR}NP${K}:${BW}$mocnpa ${O}-${BW}$mocnps ${O}$mocnpt"
echo -e "  ${B}.+sso+:-.                 ..-/+oso: "
echo -e " ${B}.++:.                           .-/+/ "
echo -e " ${B}..                                  .. "

