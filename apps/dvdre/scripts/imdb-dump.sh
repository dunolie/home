#!/bin/sh
# IMDB Dump Script.
VER="0.4.4"
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
# a tool for <a href="http://script.m-redd.com/dvdre.htm">DvDre x264 to MKV|MP4</a>
# for use with
# <a href="http://script.m-redd.com/mi-nfocreate.htm">MI nfoCreate Script</a>
# <a href="http://script.m-redd.com/imdb-thumbgrab.htm">iMDB-ThumbGrab Script</a>
#
###########################
#
# IMDB Dump Depends on
# elinks:        http://elinks.or.cz/
#
sleep 2
# check
if [[ -z $( type -p elinks ) ]]; then 
  echo -e "elinks -- NOT INSTALLED !";exit
fi
# IMDB Title
TTCODE=$1
if [ -z "$TTCODE" ]; then
  echo "Please provide a Title Number from IMDB.com (Ex: tt0083907)"
else
  unset response
# Path to Temp Folder
DVDRE="$HOME/apps/dvdre/imdb"
# Cleanup first
if [ -e $DVDRE/*.txt ]; then
  rm $DVDRE/*.txt
fi
# IMDB link
IMDUMP="elinks -dump -dump-width 300 "http://www.imdb.com/title/${TTCODE}""
# Dump to text File
$IMDUMP >> $DVDRE/$TTCODE.txt

cat $DVDRE/$TTCODE.txt | grep -Eo 'IMDb\ >.*' | cut -f 2 -d ">" | awk -F\| '{print "Title:"$1}'
echo "IMDB Page: http://www.imdb.com/title/$TTCODE "
cat $DVDRE/$TTCODE.txt | grep 'votes' | sed 's/^[ \t]*//' | cut -f 1 -d "[" | awk -F\| '{print "Rating:",$1}'
# Rating Bar # edit to fix blank char error
RATEN=$(cat $DVDRE/$TTCODE.txt | grep 'votes' | sed 's/^[ \t]*//' | cut -f 1 -d "[" | awk -F\| '{print $1}' | tr -d "(,)" | awk '{print $1}')

if [ "$RATEN" == "awaiting" ]; then
  RATEN='0'
else
  RATEN=$(cat $DVDRE/$TTCODE.txt | grep 'votes' | sed 's/^[ \t]*//' | cut -f 1 -d ".")
fi

RBARS=$(expr $RATEN / 1)

case $RBARS in
#
        1)
#
                BAR='[*---------]'
#
                ;;
#
        2)
#
                BAR='[**--------]'
#
                ;;
#
        3)
#
                BAR='[***-------]'
#
                ;;
#
        4)
#
                BAR='[****------]'
#
                ;;
#
        5)
#
                BAR='[*****-----]'
#
                ;;
#
        6)
#
                BAR='[******----]'
#
                ;;
#
        7)
#
                BAR='[*******---]'
#
                ;;
#
        8)
#
                BAR='[********--]'
#
                ;;
#
        9)
#
                BAR='[*********-]'
#
                ;;
#
        10)
#
                BAR='[**********]'
#
                ;;
#
        *)
#
                BAR='[----------]'
#
esac
#
echo " $BAR"
cat $DVDRE/$TTCODE.txt | grep -A2 'Release Date:' | tail -1 | cut -f 1 -d "[" | awk '{print "Release Date:",$2,$1,$3}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Runtime:' | tail -1 | cut -c3-300 | awk -F \| '{print "Runtime:"$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Country:' | tail -1 | cut -f 2 -d "]" | cut -f 1 -d "[" | awk -F\| '{print "Country:",$1,$2,$3}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Language:' | tail -1 | cut -f 2 -d "]" | awk '{print "Language:",$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Director:' | tail -1 | cut -f 2 -d "]" | awk -F\| '{print "Director:",$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Writer.*:' | tail -1 | cut -f 2 -d "]" | cut -f 1 -d "(" | awk -F\| '{print "Writer:",$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Genre:' | tail -1 | cut -f 2 -d "]" | cut -f 1 -d "|" | awk -F\| '{print "Genre:",$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Awards:' | tail -1 | cut -f 1 -d "[" | cut -c3-700 | awk -F\| '{print "Awards:"$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Company:' | tail -1 | cut -f 2 -d "]" | cut -f 1 -d "[" | awk -F\| '{print "Company:",$1}'
cat $DVDRE/$TTCODE.txt | grep -A2 'Plot:' | tail -1 | cut -f 1 -d "[" | cut -c3-700 | awk -F\| '{print "Plot:"$1}'
#<font color="">#</font> <font color="red">Cast Dump is clean and I'm now working on a dump of the complete cast lineup</font>
# Start Search for More
MORESTART=$(cat $DVDRE/$TTCODE.txt | grep -A16 Cast | sed 's/\[[^]\]*]//g' | grep -A21 "(Cast overview" | grep -n "more" | awk '{print $1}' | tr -d ":")
if [ "$MORESTART" != "" ];then
      MOREEND=$(cat $DVDRE/$TTCODE.txt | grep -A16 Cast | sed 's/\[[^]\]*]//g' | tail -${MORESTART} | grep -n "more" | awk '{print $1}' | tr -d ":")
# End search for More
      MOREEND=$(cat $DVDRE/$TTCODE.txt | grep -A16 Cast | sed 's/\[[^]\]*]//g' | tail -${MORESTART} | grep -n "more" | awk '{print $1}' | tr -d ":")
#
     ENDMORE=$(expr $MOREEND - 2)
     echo "Cast:";cat $DVDRE/$TTCODE.txt | grep -A16 Cast | tail -${MORESTART} | sed 's/\[[^]\]*]//g' | head -${ENDMORE}
     echo ""
else
echo "Cast:";cat $DVDRE/$TTCODE.txt | grep -A16 Cast | tail | sed 's/\[[^]\]*]//g' | tail -15
     echo ""

fi
fi

exit 0

