#!/bin/bash
# Copy|Paste M3U files to Playlist folder.
CLEANPLAYLIST=$(find ~/playlists/Music/ -name "*.m3u" -print0 | xargs -0 rm *.m3u)
DIR=$(cd /mnt/b/Music/)
$DIR
sleep 2
echo " Cleaning up Playlist - Deleting old list"
$CLEANPLAYLIST
sleep 2
echo " Done Old List deleted... ready for new links"
#
sleep 1
echo ""
echo "Creating new M3U links in playlist"
find /mnt/b/Music/Classical/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Classical/
find /mnt/b/Music/Comedy/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Comedy/
find /mnt/b/Music/Country-Folk/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Country-Folk/
find /mnt/b/Music/Electro/Breakbeat/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Breakbeat/
find /mnt/b/Music/Electro/Buddah-Bar/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Buddah-Bar/
find /mnt/b/Music/Electro/Dance/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Dance/
find /mnt/b/Music/Electro/Drum-N-Bass/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Drum-N-Bass/
find /mnt/b/Music/Electro/Dub/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Dub/
find /mnt/b/Music/Electro/Electro/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Electro/
find /mnt/b/Music/Electro/House/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/House/
find /mnt/b/Music/Electro/Industrial/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Industrial/
find /mnt/b/Music/Electro/Mash-Up/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Mash-Up/
find /mnt/b/Music/Electro/Techno/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Techno/
find /mnt/b/Music/Electro/Trance/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Trance/
find /mnt/b/Music/Electro/Trip-Hop/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Electro/Trip-Hop/
find /mnt/b/Music/HipHop-Rap/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/HipHop-Rap/
find /mnt/b/Music/Indie/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Indie/
find /mnt/b/Music/Jazz-Soul/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Jazz-Soul/
find /mnt/b/Music/Latin/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Latin/
find /mnt/b/Music/OST/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/OST/
find /mnt/b/Music/Pop-Oldies/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Pop-Oldies/
find /mnt/b/Music/Punk-Reggae-Ska/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Punk-Reggae-Ska/
find /mnt/b/Music/Rock/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/Rock/
find /mnt/b/Music/White_Collection/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/White_Collection/
find /mnt/b/Music/World/ -name "*.m3u" -print0 | xargs -0 ln -s --target-directory ~/playlists/Music/World/
echo " Done .. M3U files linked.. injoy your Music..."
sleep 1
exit 0
