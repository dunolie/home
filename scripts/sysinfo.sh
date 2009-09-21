#!/bin/sh
# Custom System Info Script
# 0.1 Date Wed Mar 25 22:02:57 PDT 2009
# by: MreDD
#######
#
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
ramuse=$(free -m | grep "Mem:" | awk '{print $3}')
netcard=$(lspci | grep "Ethernet" | awk '{print $4,$6,$7,$2}')
tvcard=$(lspci | grep "Multimedia" | awk '{print $5,$8,$10$11,$13,$14,$15,$16,$17}')
soundcard=$(lspci | grep "Audio" | head -1 | awk '{print $4,$6,$9,$10,$11}')
raidcard=$(lspci | grep "RAID" | awk '{print $5,$7,$8,$9,$10}')
#tinetin=$(ifconfig $interface | grep "(" | cut -c31-38)
#tinetout=$(ifconfig $interface | grep "(" | cut -c60-65)
tinetin=$(ifconfig $interface | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
tinetout=$(ifconfig $interface | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
hd1=$(df -lh / | grep "/" | awk '{print $2"/"$1}')
#hd2=$(df -lh /usr | grep "usr" | awk '{p rint $2"/"$1}')
#hd3=$(df -lh /var | grep "var" | awk '{print $2"/"$1}')
hd4=$(df -lh /home | grep "home" | awk '{print $2"/"$1}')
hd5=$(df -lh /mnt/1 | grep "1" | awk '{print $2"/"$1}')
hd6=$(df -lh /mnt/2 | grep "2" | awk '{print $2"/"$1}')
#hd7=$(df -lh /mnt/p3 | grep "p3" | awk '{print $2"/"$1}')

echo "OS: $distro | Up: $uptime "
echo "Sys: $name/$hardware $cpuinfo | Krnl: $release " 
echo "Gfx: $vidcard | Res: $scrnrez "
echo "Ram: $ramuse/$ramall | Keyboard: Logitech G11 "
echo "Net: $netcard In: $tinetin Out: $tinetout "
echo "TVcard: $tvcard "
echo "Soundcard: $soundcard "
echo "Raidcard: $raidcard "
echo "Hdd: $hd1 - $hd4 - $hd5 - $hd6 "

