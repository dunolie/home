#!/bin/bash
# Generates .m3u for many Audio Formats
#
# By: MreDD
#
CLEANMUSIC=$(find /mnt/b/Music/ -name "*.m3u" -print0 | xargs -0 rm *.m3u)
echo "Cleaning up Music Folders M3Us"
$CLEANMUSIC
echo " Done.. M3U files deleted .. ready to create new files"
sleep 1
IFS=$'\n'
#
M3Ulist="`pwd`/M3UfileList.txt"
#
rm -f $M3Ulist
#
indexCurrDir ()
{
FileList="" # initialize empty variable FileList
for FileTypes in "ogg" "mp3" "flac" "wav" "m4a" "wma" "wv" "swa" "aac" "ac3"
#
do
FindFiles=$(find $(pwd) -type f -iname "*.$FileTypes" | sort)
#
FileList=$FileList$FindFiles
#
done
#
if [ "${#FileList}" != "0" ]
then
CurrDir=$(pwd)
echo "$CurrDir"
m3uName=$(basename $CurrDir)
#
echo "Writing m3u playlist."
echo "$FileList" > "${m3uName}.m3u"
echo "$CurrDir/${m3uName}.m3u" >> "$M3Ulist"
#
fi
}

AllDirs=$(find $(pwd) -type d | sort)
for Directory in $AllDirs
do
cd "$Directory"
indexCurrDir
done

exit 0
