#!/bin/sh
#
#Ctrl-C Aborts

X=0
while [ $X -le 20 ]
do
      lsof -i -n -P
      sleep 5
      clear
done
