#!/bin/bash
#search for elements in "$1" which "$2", move to "$3" and replace " " with "_"
#
find "$1" -maxdepth 1 -type f -name "$2" \
    | awk -v dest="$3" -F'/' '{origin = $0 ; \
        gsub(/ / , "_") ; \
        print "\047"origin"\047" ; \
        print dest $NF ; }' \
    | xargs -L 2 mv -v
