#!/bin/bash
# ~/.bash_aliases
#
##################

####################################################
## Add the Following Lines to ~/.bashrc            #
# Bash Aliases                                     #
##################                                 #
#if [ -f ~/.bash_aliases ]; then                   #
# . ~/.bash_aliases                                #
#fi                                                #
####################################################

#######################
##   Start Aliases   ##
#######################

## Now Edit or Add Aliases to File
##################
# Systeminfo
##################
alias sinfo="sh ~/scripts/sysinfo.sh"
alias ssinfo="sh ~/scripts/ssinfo.sh"

# User Defined Aliases
##################
alias ls="ls --color=auto"
alias ll="ls --color=auto -l"
alias lsa="ls --color=auto -A"
alias lsg="ls --color=auto | grep"
alias lll="ls --color=auto -al"
alias cls="clear"
alias clls="clear; ls"
alias na="nano"
alias web="cd $HOME/dls/ && elinks https://ssl.scroogle.org" 
alias ~="cd ~"
alias md="mkdir"
alias ps="ps ax"
alias home="cd ~"
alias un="tar -zxvf"
alias mountedinfo="df -hT"
alias ping="ping -c 10 "
alias ns="netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2"
alias da="date "+%Y-%m-%d %A    %T %Z""
alias ebrc="vim ~/.bashrc"
alias c="cal"
alias up="uptime"
alias exi="clear;exit"
alias x="xinit"
alias shutdown="sudo shutdown -h now"
alias miPod="pmount -w /dev/sdg2 iPod"
alias uiPod="pumount iPod"
alias catinfo="cat *.info"
alias mvnzb="~/scripts/misc/mvnzb.sh"
alias mplayeralsa="mplayer -ao alsa -vf pp=lb "
alias comterm="urxvt -name 'com' &"
alias editterm="urxvt -name 'edit' &"
alias devterm="urxvt -name 'dev' &"
alias trannyterm="transset .97 "

#UZBL
alias uzblweb="$HOME/.config/uzbl/scripts/uzbl_tabbed.py"

# Pacman
# sudo pacman -Syu by typing pacup (sudo must be installed and configured first)
alias pacup="sudo pacman -Syu"
# sudo pacman -S by typing pac
alias pac="sudo pacman -S"
# sudo pacman -R by typing pac
alias pacR="sudo pacman -R"
# sudo pacman -U by typing pac
alias pacU="sudo pacman -U"
# colorized pacman output with pacs alias:
alias pacs="pacsearch"
pacsearch() {
   echo -e "$(pacman -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}
# Yaourt aliases
alias yaoS="yaourt -S"
alias yaoSy="yaourt-Sy"
alias yaoR="yaourt -R"
# colorized pacman output with pacs alias:
alias pacs="yaosearch"
yaosearch() {
   echo -e "$(yaourt -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# Screen Aliases
#############
alias scrn1="screen -c ~/.screenrc_1"
alias scrn2="screen -c ~/.screenrc_2"

# Slackware Tools
#############
#alias pkgtool="sudo /sbin/pkgtool "
#alias slaptget="sudo /usr/sbin/slapt-get "
#alias makepkg="sudo /sbin/makepkg "
#alias installpkg="sudo /sbin/installpkg "
#alias removepkg="sudo /sbin/removepkg "
#alias explodepkg="sudo /sbin/explodepkg "
#alias upgradepkg="sudo /sbin/upgradepkg "
#alias slackbuild
#alias buildinstall="chmod a+x *.SlackBuild ;sudo ./*.SlackBuild;installpkg /tmp/*.tgz;sudo rm /tmp/*.tgz"

# Various Fun Test
#############
alias bz2="sh ~/scripts/bz2.sh"
alias figlet="figlet -d ~/.figfonts/ "
alias forcowsay="${R}fortune | ${B}cowsay"
#alias quadconky="sh ~/scripts/quad_conky.sh"
#alias rightconky="sh ~/scripts/right-conky.sh"
#alias leftconky="sh ~/scripts/left-conky.sh"
alias conky-1="sh ~/scripts/conky-scripts/conky-new.sh"
#alias nzbgrab="hellanzb.py enqueuenewzbin "

#Alias to Chmod
#############
alias 755="find . -type d -exec chmod 755 {} \;"
alias 644="find . -type f -exec chmod 644 {} \;"
alias 664="find . -type f -exec chmod 664 {} \;"
alias 775="find . -type f -exec chmod 775 {} \;"

# Alias"s to control hardware
#############
alias dvd0o="eject /dev/dvd0"
alias dvd0c="eject -t /dev/dvd0"
alias dvd1o="eject /dev/dvd1"
alias dvd1c="eject -t /dev/dvd1"
alias scan="scanimage -L"

# DVD Backup - Rip
#############
alias dvdbkupmain="dvdbackup -F -o /mnt/p2/rip/drip"
alias dvdbkupall="dvdbackup -M -o /mnt/p2/rip/drip"

# Mocp Alias
#############
#alias playit="mocp -l "
#alias pause="mocp -P "

# Alias to some Applications
##################
alias kdx="~/kdx/KDXClient.lexe & "
alias imageshackup="~/scripts/imageshackup.sh"
alias tronad="~/games/bin/armagetronad"
#alias idesktool="~/.idesktop/idesktool"
#alias mediainfohtm="mediainfo --Output=HTML " 
alias vlcremote="vlc --control lirc "
alias vlctv="v4l2-ctl -i 1 && vlc --hdtv-fix --aspect-ratio=16:9 --deinterlace-mode=b --disable-screensaver --control lirc /dev/video0"
alias mplayertv="mplayer -ao alsa -vf pp=lb /dev/video0 "
alias weechat="/usr/local/bin/weechat-curses"

# Office
##################
alias massotf2ttf="~/scripts/mass-otf2ttf.sh"

# Alias to Scripts
##################
# Audio
alias aac2mp3="sh ~/scripts/rip/audio/aac2mp3.sh "
alias cleanmp3="sh ~/scripts/rip/audio/cleanmp3.sh "
alias m4a2mp3="sh ~/scripts/rip/audio/m4a2mp3.sh "
alias m4a2wav="sh ~/scripts/rip/audio/m4a2wav.sh "
alias m4a2ogg="sh ~/scripts/rip/audio/m4a2ogg.sh "
alias mp32wav="sh ~/scripts/rip/audio/mp32wav.sh "
alias mp32ogg="sh ~/scripts/rip/audio/mp32ogg.sh "
alias ogg2mp3="sh ~/scripts/rip/audio/ogg2mp3.pl "
alias tagm4a2mp3="sh ~/scripts/rip/audio/tagm4a2mp3.sh "
alias wav2mp3="sh ~/scripts/rip/audio/wav2mp3.sh "
alias wav2ogg="sh ~/scripts/rip/audio/wav2ogg.sh "
alias wma2mp3="sh ~/scripts/rip/audio/wma2mp3.sh"
alias wma2wav="sh ~/scripts/rip/audio/wma2wav.sh "
alias rmm4a="sh ~/scripts/rip/audio/rmm4a.sh "
alias rmwav="sh ~/scripts/rip/audio/rmwav.sh "
alias rmogg="sh ~/scripts/rip/audio/rmogg.sh "
alias cd_rip="sh ~/scripts/rip/audio/cd_rip.sh "
alias genm3u="sh ~/scripts/rip/audio/genm3u.sh "
alias mvm3uplayfolder="sh ~/scripts/rip/audio/mvm3uplayfolder.sh "
# Video
alias DvDre="sh ~/apps/dvdre/scripts/dvdre.sh"

# Screenshot
##################
alias snapscreen="sh ~/scripts/image/scrotsnap.sh "
alias snapdelay="sh ~/scripts/image/scrotdelay.sh "
alias dragscrot="sh ~/scripts/image/dragscrot.sh "
alias infosshot="perl ~/scripts/image/info.pl"

# Alias to SSH
##################

# Telnet
###############

# Alias to FTP
###############


# Alias to SSHFS
##################
alias ssfs-anime="sshfs me@1.1.1.1:/mnt/1/Anime/ $HOME/mnt/Anime -C -p 60122"
alias ssfs-hd1="sshfs me@1.1.1.1:/mnt/tb2/ $HOME/mnt/Film/1 -C -p 60122"
alias ssfs-hd2="sshfs me@1.1.1.1:/mnt/share/Bluray-HD2/ $HOME/mnt/Film/2 -C -p 60122"
alias ssfs-hd3="sshfs me@1.1.1.1:/mnt/br2/ $HOME/mnt/Film/3 -C -p 60122"
alias ssfs-tv="sshfs me@1.1.1.1:/mnt/2/TV/ $HOME/mnt/TV/ -C -p 60122"
alias ssfs-music="sshfs me@1.1.1.1:/mnt/f1/Music/ $HOME/mnt/Music/ -C -p 60122"
alias ssfs-books="sshfs me@1.1.1.1:/mnt/f1/Books/ $HOME/mnt/Books/ -C -p 60122"
alias ssfs-roms="sshfs me@1.1.1.1:/mnt/share/Roms/ $HOME/mnt/roms -C -p 60122"
alias ssfs-sabnzb="sshfs me@1.1.1.1:/mnt/share/sabnzb/ $HOME/mnt/nzb -C -p 60122"

alias ssfs-uanime="fusermount -u $HOME/mnt/Anime"
alias ssfs-uhd1="fusermount -u $HOME/mnt/Film1"
alias ssfs-uhd2="fusermount -u $HOME/mnt/Film2"
alias ssfs-uhd3="fusermount -u $HOME/mnt/Film3"
alias ssfs-utv="fusermount -u $HOME/mnt/TV"
alias ssfs-umusic="fusermount -u $HOME/mnt/Music"
alias ssfs-ubooks="fusermount -u $HOME/mnt"
alias ssfs-uroms="fusermount -u $HOME/mnt/roms"
alias ssfs-usabnzb="fusermount -u $HOME/mnt/nzb"

# Fifo Nicklist Irssi
##################
alias irsii="aterm -name aterm -title irssi -g 112x65+215+32 &"
alias userlist="aterm -name aterm -title Ulist -g 17x30+1255+255 &"
alias nicklist="cat ~/.irssi/nicklistfifo"

# VNC Server
##################
alias vncssh="ssh *@* -p * -L*:localhost:*"

# Wallpapers
##################
alias wallpaperzim="feh --bg-center ~/images/wallpapers/invader-zim2.png"
alias wallpaperhobbes="feh --bg-center ~/images/wallpapers/Calvin-Hobbes.jpg"
alias wallpapercanti="feh --bg-center ~/images/wallpapers/Canti.png"
alias wallpaperflcl=-"feh --bg-center ~/images/wallpaper/1440-900-FLCL-bw-2.png"

# Apps with Wine
##################
#alias gchrome="wine /opt/windows/Google/chrome/chrome.exe"

# easy extraction
 extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#####################
##   End Aliases   ##
#####################

