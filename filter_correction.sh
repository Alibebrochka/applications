#!/bin/bash
#
#find ~/music/ names files with pattern 'Sefon' in Title grep
#
#find ~/music/ -type f -name '*.mp3*' -exec exiftool -s -p '$FileName' -p '$Title' {} 2>/dev/null \; | grep 'Sefon' -B1 | grep 'mp3'
#
#find ~/music/ names files with pattern 'Sefon' in Title awk
#
#find ~/music/ -type f -name '*.mp3*' \
#    -exec exiftool -s -p '$FileName:$Title' {} 2>/dev/null \; \
#   | awk -F':' '/Sefon/ { print $1 "\n" $2 }' 
#
#find ~/music/ files with Title
#
#exiftool ~/music/ * -s -p '$FileName:$Title' 2>&1 | awk '/Title/ { print $NF }'
#
#find ~/music/ files with ' ' in names and delit
#
find . -type f -name '*.mp3' \
    | awk '/ /{origin = $0 ; \
        gsub(/ / , "_") ; \
        print "\047"origin"\047" ; \
        print $0 ; }' \
    | xargs -L 2 mv
