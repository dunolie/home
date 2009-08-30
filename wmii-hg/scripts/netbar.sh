#!/bin/sh
# conky taskbar
cat $HOME/.conkywmii|tail -n 1|awk '{print $13,$14$15,$16,$17$18}'
