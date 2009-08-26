#!/bin/sh
#
COREONE=$(sensors | grep "Core 0" | cut -c15-18 | cut -f 1 -d ".")
CORETWO=$(sensors | grep "Core 1" ${color}| cut -c15-18 | cut -f 1 -d ".")
CORETHREE=$(sensors | grep "Core 2" | cut -c15-18 | cut -f 1 -d ".")
COREFOUR=$(sensors | grep "Core 3" ${color}| cut -c15-18 | cut -f 1 -d ".")
GFX=$(nvidia-settings -q GPUCoreTemp |grep '):'| awk '{print $4}' | cut -f 1 -d ".")
HARDDISKA=$(sudo hddtemp /dev/sda|cut -c32-34)
HARDDISKB=$(sudo hddtemp /dev/sdb|cut -c32-34)
echo "C0: $COREONE° C1: $CORETWO° C2: $CORETHREE° C3: $COREFOUR° ${color}Gfx: $GFX° HDA: $HARDDISKA HDB: $HARDDISKB "
