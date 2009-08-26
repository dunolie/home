#!/bin/bash
#
# mass urar recursively

for name in `find . -iname \*.rar`; do unrar x $name; done
