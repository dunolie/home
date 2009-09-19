#!/bin/bash
#
##########
RENAME="$HOME/dls/nzb/nzbget/rename"
cd $RENAME
for i in *.nzb; do
    if [ -e "$i" ]; then
        file=`basename "$i" .nzb`
        NEWNAME=$(ls "$i" | cut -f 2 -d "_")
        mv "$i" "$NEWNAME"
    fi
done
