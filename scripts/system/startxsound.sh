#!/bin/bash
#
rm $HOME/startxsounds/ssa.txt;ls $HOME/startxsounds/* > $HOME/startxsounds/ssa.txt
#
sed -n $(( $RANDOM % $(wc -l $HOME/startxsounds/ssa.txt | cut -d' ' -f 1) ))p $HOME/startxsounds/ssa.txt | while read f 
do
        SONG=$(echo $f | awk ' { print $1 } ')

        mpg123 $SONG &
done

