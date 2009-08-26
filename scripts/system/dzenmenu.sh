#!/bin/bash
# 
# Dzen2 App Launcher script box version by Rasmus Edgar.
# -tw = Width of titlebar, -w = Width of slavewindow,
# -l = length of slavewindow. Remember to adjust -l accordingly when adding 
# apps. ^pa(*) is for text/decoration alignment.
# 
# The getcurpos(x+y) programs are minor hacks of Robert Manea's getcurpos available
# on his website. The only thing that is changed in the source code is the removal of
# one of the "%d" and e.xbutton.*'s.
#
# Menu script starts below.   
#
# Needed Applications:
armagetronad="$HOME/games/bin/armagetronad"

AP1=midori
AP2=filezilla
AP3=thunderbird
AP4=leafpad
AP5=thunar
AP6=gimp
GM1=armagetronad
GM2=vdrift
GM3=armyops

# Get cursor position:

XP=$(getcurpos | cut -c1-4)
YP=$(getcurpos | cut -c5-10)

# Decorations for the menu:

DC1=1x17
DC2=3x2
DC3=4x2
DC4=3x1
DC5=123x10
DC6=125x17

# Font:

FONT="-artwiz-snap-*-*-*-*-*-*-*-*-*-*-iso8859-1"

# Menu title:

TI="Void Menu"

# Colors:

FG1=#9ab8c2
FG2=#FFFFFF
FG3=#D9A509
BG1=#000000

# Icons:

IC1=$HOME/images/icons/xbm8x8/fox.xbm
IC2=$HOME/images/icons/xbm8x8/shroom.xbm
IC3=$HOME/images/icons/xbm8x8/mail.xbm
IC4=$HOME/images/icons/xbm8x8/leaf.xbm
IC5=$HOME/images/icons/xbm8x8/pcman.xbm
IC6=$HOME/images/icons/xbm8x8/gimp.xbm
IC7=$HOME/images/icons/xbm8x8/mouse_01.xbm
IC8=$HOME/images/icons/xbm8x8/geany.xbm
IC9=$HOME/images/icons/xbm8x8/eye_l.xbm

# Text piped to Dzen2

(echo "^ro(${DC6})^ib(1)^pa(30)$TI" ;echo -e "^fg(${FG1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC1})^fg(${FG1}) ${AP1} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC2})^fg(${FG1}) ${AP2} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC3})^fg(${FG1}) ${AP3} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC4})^fg(${FG1}) ${AP4} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC5})^fg(${FG1}) ${AP5} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC6})^fg(${FG1}) ${AP6} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC7})^fg(${FG1}) ${GM1} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC8})^fg(${FG1}) ${GM2} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^r(${DC1})^r(${DC2})^r(${DC3}) ^fg(${FG3})^i(${IC9})^fg(${FG1}) ${GM3} ^pa(117)^r(${DC3})^r(${DC2})^r(${DC1})\
\n^ro(${DC6})^ib(1)^pa(2) hate 101")\
| (dzen2 -y "$YP" -x "$XP" -fn "$FONT" -bg "$BG1" -fg "$FG1" -l 10 -tw 125 -ta l -w 125 -m -p -e 'onstart=uncollapse;button1=menuexec,exit;leaveslave=exit;button3=exit')
