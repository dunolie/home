! --
! file:     ~/.Xdefaults
! author:   Mike reDD | http://m-redd.com
! modified: Wed Sep  2 18:52:43 PDT 2009
! vim:enc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=xdefaults:
! --

! Xcursor --

 Xcursor*theme: Vanilla-DMZ-AA
 Xcursor.size:  22

! Xft settings --

Xft.dpi:        96
Xft.antialias:  true
Xft.rgba:       rgb
Xft.hinting:    full
Xft.hintstyle:  hintslight

! c64 settings --

c64*font:                xft:Terminus:autohint=false:antialias=false:size=7
c64*background:          #191717
c64*foreground:          #006e85

! Terminal theme --
! Main
*background:    #191717
*foreground:    #006e85
! Black
*color0:        #060101
*color8:        #66825d
! Red
*color1:        #ffa07a
*color9:        #e9967a
! Green
*color2:        #527b66
*color10:       #4c5f46
! Yellow
*color3:        #ded838
*color11:       #efef60
! Blue
*color4:        #6da3ae
*color12:       #516f98
! Magenta
*color5:        #967395
*color13:       #826ab1
! Cyan
*color6:        #69a2b0
*color14:       #2d9bb7
! White
*color7:        #b3b3b3
*color15:       #eeeeef


! rxvt-unicode --

URxvt*termName:                   rxvt-256color
! font preference
URxvt*font:                       xft:Pragmata:pixelsize=13:antialias=true:hinting=true
URxvt*boldFont:                   xft:Pragmata:pixelsize=14:antialias=true:bold:hinting=true
URxvt*italicFont:                 xft:Terminus:size=13:antialias=true:hinting=true
URxvt*bolditalicFont:             xft:Terminus:size=13:antialias=true:hinting=true
URxvt.keysym.C-0:              command:\033]710;xft:Pragmata:pixelsize=13:autohint=true\007
URxvt.keysym.C-minus:          command:\033]710;xft:Terminus:pixelsize=12:autohint=true\007
URxvt.keysym.C-underscore:     command:\033]710;xft:Pragmata:pixelsize=17,xft:Bitstream Vera Sans Mono:autohint=true\007
URxvt.keysym.C-equal:          command:\033]710;xft:Terminus:pixelsize=20,xft:Bitstream Vera Sans Mono:autohint=true\007
URxvt.keysym.C-plus:           command:\033]710;xft:Pragmata:pixelsize=24,xft:Bitstream Vera Sans Mono:autohint=true\007
!initial size
URxvt*geometry:                   126x30
!internal whitespace
URxvt*borderless:                 true
URxvt*internalBorder:     0
!fade text n% upon unfocus
!URxvt*fading:             20
!darken=(0 to 100) lighten=(-1 to -100)
URxvt*shading:            5
!tint background with this color
URxvt*tintColor:          #191717
!set to 32-bit for real transparency (compositing required)
URxvt*depth:             32
!save n lines of scrollback buffer
URxvt*saveLines:          32767
!flash screen for attention
URxvt*visualBell:         true
!jump to bottom (prompt) on keypress
URxvt*scrollTtyKeypress:  true
!jump to bottom (prompt) when tty gets new lines
URxvt*scrollWithBuffer:   false
!jump to bottom (prompt) on tty output
URxvt*scrollTtyOutput:    false
!toggle scrollbar
URxvt*scrollBar:                  false
!scrollbar styles: rxvt, plain, next or xterm
URxvt*scrollstyle:        plain
!scrollbar alignment
URxvt*scrollBar_right:    true
URxvt*scrollColor:        #777777
!transparency
URxvt*transparent:        true
!is this a login shell?
URxvt*loginShell:         true
!set the TERM environment variable
!enable pseudo-transparency (requires depth: 24 (see above))
!URxvt*inheritPixmap:      true
!delimiters for double-click mouse selection
URxvt*cutchars:           "()*,<>[]{}|'
!screen dump settings
URxvt*print-pipe:         cat > $(echo urxvt.dump.$(date +'%Y%M%d%H%m%S'))
!secondary screen scroll (default enabled)
URxvt*secondaryScroll:    true
!de-iconify (map) on receipt of a bell character
URxvt*mapAlert:           true
!inhibit writing record into the system log file utmp
URxvt*utmpInhibit:        true
!! BEGIN urlLauncher settings !!
URxvt*perl-lib:           /usr/lib/urxvt/perl/
URxvt*perl-ext-common: default,matcher
URxvt*urlLauncher:        urxvt-to-uzbl.sh
!URxvt*urlLauncher:        conkeror
!! END urlLauncher settings !!
!tabs
!URxvt*tabbed.hide              true
!URxvt*tabbed.newButton         false
URxvt*tabbar-fg:               64
URxvt*tabbar-bg:               234
URxvt*tab-fg:                  95
URxvt*tab-bg:                  233
URxvt*tabbed.secondaryScroll:  true
URxvt.tabbed.urlLauncher:      urxvt-to-uzbl.sh
!URxvt*urlLauncher:        conkeror
URxvt*tabbed.matcher.button:   2
URxvt*tabbed.perl-ext-common: default,matcher
URxvt*keysym.C-Delete:    perl:matcher
URxvt*matcher.button:     1
URxvt*matcher.pattern.1:  \\bwww\\.[\\w-]+\\.[\\w./?&@#-]*[\\w/-]
URxvt*matcher.pattern.2:  \\B(/\\S+?):(\\d+)(?=:|$)
URxvt*matcher.launcher.2: gvim +$2 $1

!transparent=0000 opaque=ffff
URxvt*cursorColor:       #006e85
URxvt*cursorColor2:      #000000
URxvt*background:        #191717
URxvt*foreground:        #276b47
URxvt*colorBD:           #ffffff
URxvt*colorIT:           #bbbbbb
URxvt*colorUL:           #999999
URxvt*underlineColor:    #006e85

! xterm --

xterm*geometry:           80x25
xterm*faceName:           Terminus:size=12:antialias=true:hinting=true
!xterm*font:             -*-dina-medium-r-*-*-16-*-*-*-*-*-*-*
xterm*dynamicColors:      true
xterm*utf8:               2
xterm*eightBitInput:      true
xterm*saveLines:          512
xterm*scrollTtyKeypress:  true
xterm*scrollTtyOutput:    false
xterm*scrollBar:          false
xterm*rightScrollBar:     true
xterm*loginShell:         true
xterm*jumpScroll:         true
xterm*multiScroll:        true
xterm*toolBar:            false

!aterm settings --    

aterm*background:		#191717
aterm*foreground:		#006e85
aterm*transparent:		true
aterm*shading:			30
aterm*cursorColor:		gray
aterm*saveLines:		2000
!aterm*tinting:			gray
aterm*scrollBar:		false
!aterm*scrollBar_right:	         true
aterm*transpscrollbar:		true
aterm*borderwidth:		0
aterm*font:	-artwiz-snap-*-*-*-*-*-*-*-*-*-*-*-*
aterm*geometry:			80x25
!aterm*fading:			70  

! xpdf --

xpdf*enableFreetype:    yes
xpdf*antialias:         yes
xpdf*foreground:        #006e85
xpdf*background:        #191717
xpdf*urlCommand:        /usr/bin/firefox %s

! lal clock --

lal*font:       Arial
lal*fontsize:   12
lal*bold:       true
lal*color:      #488dd2
lal*width:      150
lal*format:     %a %b %d %l:%M%P

! xclock --

 xclock*update:            1
 xclock*analog:            false
 xclock*Foreground:        #006e85
 xclock*background:        #191717

! x11-ssh-askpass --

x11-ssh-askpass*font:                   -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
x11-ssh-askpass*background:             #191717
x11-ssh-askpass*foreground:             #276b47
x11-ssh-askpass.Button*background:      #000000
x11-ssh-askpass.Indicator*foreground:   #ff9900
x11-ssh-askpass.Indicator*background:   #FFFFFF
x11-ssh-askpass*topShadowColor:         #006e85
x11-ssh-askpass*bottomShadowColor:      #000000
x11-ssh-askpass.*borderWidth:           1

! xscreensaver --

!font settings
xscreensaver.Dialog.headingFont:        -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.bodyFont:           -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.labelFont:          -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.unameFont:          -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.buttonFont:         -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.Dialog.dateFont:           -*-dina-medium-r-*-*-12-*-*-*-*-*-*-*
xscreensaver.passwd.passwdFont:         -*-dina-bold-r-*-*-12-*-*-*-*-*-*-*
!general dialog box (affects main hostname, username, password text)
xscreensaver.Dialog.foreground:         #006e85
xscreensaver.Dialog.background:         #191717
xscreensaver.Dialog.topShadowColor:     #434343
xscreensaver.Dialog.bottomShadowColor:  #424242
xscreensaver.Dialog.Button.foreground:  #276b47
xscreensaver.Dialog.Button.background:  #191717
!username/password input box and date text colour
xscreensaver.Dialog.text.foreground:    #006e85
xscreensaver.Dialog.text.background:    #191717
xscreensaver.Dialog.internalBorderWidth:24
xscreensaver.Dialog.borderWidth:        20
xscreensaver.Dialog.shadowThickness:    2
!timeout bar (background is actually determined by Dialog.text.background)
xscreensaver.passwd.thermometer.foreground:  #276b47
xscreensaver.passwd.thermometer.background:  #191717
xscreensaver.passwd.thermometer.width:       8
!datestamp format--see the strftime(3) manual page for details
xscreensaver.dateFormat:    %I:%M%P %a %b %d, %Y

!xcalc --

xcalc*geometry:                        225x300
xcalc.ti.bevel.background:             #191717
xcalc.ti.bevel.screen.background:      #000000
xcalc.ti.bevel.screen.DEG.background:  #000000
xcalc.ti.bevel.screen.DEG.foreground:  #276b47
xcalc.ti.bevel.screen.GRAD.background: #000000
xcalc.ti.bevel.screen.GRAD.foreground: #276b47
xcalc.ti.bevel.screen.RAD.background:  #000000
xcalc.ti.bevel.screen.RAD.foreground:  #276b47
xcalc.ti.bevel.screen.INV.background:  #000000
xcalc.ti.bevel.screen.INV.foreground:  Red
xcalc.ti.bevel.screen.LCD.background:  #000000
xcalc.ti.bevel.screen.LCD.foreground:  #276b47
xcalc.ti.bevel.screen.LCD.shadowWidth: 0
xcalc.ti.bevel.screen.M.background:    #000000
xcalc.ti.bevel.screen.M.foreground:    #276b47
xcalc.ti.bevel.screen.P.background:    #000000
xcalc.ti.bevel.screen.P.foreground:    Yellow
xcalc.ti.Command.foreground:  #006e85
xcalc.ti.Command.background:  #191717
xcalc.ti.button5.background:  #000000
xcalc.ti.button19.background: #191717
xcalc.ti.button18.background: #191717
xcalc.ti.button20.background: #191717
!uncomment to change label on division button
!xcalc.ti.button20.label:      /
xcalc.ti.button25.background: #191717
xcalc.ti.button30.background: #191717
xcalc.ti.button35.background: #191717
xcalc.ti.button40.background: #191717
xcalc.ti.button22.background: #191717
xcalc.ti.button23.background: #191717
xcalc.ti.button24.background: #191717
xcalc.ti.button27.background: #191717
xcalc.ti.button28.background: #191717
xcalc.ti.button29.background: #191717
xcalc.ti.button32.background: #191717
xcalc.ti.button33.background: #191717
xcalc.ti.button34.background: #191717
xcalc.ti.button37.background: #191717
xcalc.ti.button38.background: #191717
xcalc.ti.button39.background: #191717
XCalc*Cursor:                 hand2
XCalc*ShapeStyle:             rectangle

