#!/bin/sh
# ~/.xsession | ~/.xinitrc
# By: MreDD     mredd (at) 0tue0.com
#
###############################
#Font Help
xset +fp ${HOME}/.fonts
# SSH
#SSH_ASKPASS=ssh-askpass ssh-add

# Misc
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Aliases
x='xinit'

# Start Window Manager
case "$1" in
    awesome)
           #xbindkeys &
           #irexec &
           #xscreensaver -no-splash &
           #numlockx &
           #$HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           #$HOME/scripts/system/startxsound.sh &   
           exec ck-launch-session awesome ;;
    dwm)
           #!/bin/bash
           urxvt &
           numlockx on &
           while true; do
           xsetroot -name "`uptime`"
           sleep 1
           done &
           dwm
           exec $HOME/.dwmrc ;;
    ecomorph)
           xbindkeys &
           irexec &
           numlockx &
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           #urxvt -name 'shell' &    
           exec ck-launch-session enlightenment_start ecomorph ;;
    e17)
           xbindkeys &
           irexec &
           numlockx &
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh & 
           exec ck-launch-session /usr/bin/enlightenment_start ;;
    evilwm)
           xsetroot -cursor_name left_ptr
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrc | dzen2 -x 1750 -y 2 -w 1295 -fg '#6C6967' -bg '#000000' -ta c  -fn '-artwiz-snap-*-*-*-*-*-*-*-*-*-*-*-*' &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           # Startup Sounds
           #$HOME/scripts/system/startxsound.sh &  
           exec ck-launch-session evilwm -snap 10 -bw 1 -fg 636464 ;;
    fluxbox)
           xbindkeys &
           irexec &
           ipager &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           idesk &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           exec ck-launch-session startfluxbox ;;
    pekwm)  
           urxvtd -q -f -o &
           exec ck-launch-session pekwm ;;
    ratpoison)
           xbindkeys &
           irexec &
           ipager &
           xscreensaver -no-splash &
           numlockx &
           #$HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &  
           exec ck-launch-session ratpoison ;;
    scrotwm)
           xsetroot -cursor_name left_ptr
           feh --bg-center $HOME/images/wallpapers/wallpapernew.png &
           xbindkeys &
           irexec &
           skippy-xd &
           xscreensaver -no-splash &
           numlockx &
           conky -c $HOME/.conkyrc &
           conky -c $HOME/.conkyrc_email & 
           $HOME/scripts/system/startxsound.sh &  
           stalonetray &
           tint2 &
           ipager &  
           exec ck-launch-session scrotwm ;;
    weewm)
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &  
           exec ck-launch-session weewm  ;;           
    wmii)
           xcompmgr -c & 
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           #$HOME/scripts/image/rotate-wallpaper.sh &
           feh --bg-center $HOME/images/wallpapers/walltehpaper.png
           #conky -c ~/.conkyrc | dzen2 -x 1750 -y 2 -w 1295 -fg '#6C6967' -bg '#000000' -ta c  -fn '-artwiz-snap-*-*-*-*-*-*-*-*-*-*-*-*' &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &  
           #conky -c ~/.conkyrc-email > ~/.get_mail &
           #conky -c ~/.conkyrcore > ~/.conkywmii &
           until exec ck-launch-session wmii; do true ; done  ;;
    xmonad)
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &  
           exec ck-launch-session xmonad  ;;
    *)
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           urxvt -name 'shell' &    
           exec ck-launch-session scrotwm   ;;
esac
