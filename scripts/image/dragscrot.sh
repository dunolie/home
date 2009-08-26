#!/bin/bash
urxvt -g 40x10+50+22 -e scrot -s -b '%T_drag.png' -e 'mv $f ~/images/shots/'
