#!/bin/bash
# Random Wallpaper Selector
# using Flubox fbsetbg
############
# http://script.m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD
# projects - @ - 0tue0 (dot) com
#
# Path to Wallpapers
wp="$HOME/images/wallpapers/"

# Go to Wallpapers
cd "$wp"

# List name of random image
rfile=`ls *.jpg *.png |sed -n $((RANDOM%$(ls *.jpg *.png |wc -l)+1))p`

# FBsetBG set's wallpaper
fbsetbg -C "$wp$rfile"


