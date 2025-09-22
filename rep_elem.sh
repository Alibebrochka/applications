#!/bin/bash
#search for elements in "$1" which "$2", move to "$3" and replace " " with "_"

oldPath="$1"
pattern="$2"
newPath="$3"

find "$oldPath" -maxdepth 1 -type f -name "$pattern" -print0 |
    while IFS= read -r -d $'\0' file; do
        #get base name
        fileName=$(basename "$file")

        #replase " " with "_"
        newFileName="${fileName// /_}"

        #new path
        destinationPath="${newPath}/${newFileName}"

        mv -v "$file" "$destinationPath"
    done

# awk -v dest="$3" -F'/' '{origin = $0 ; \
#       gsub(/ / , "_") ; \
#       print "\047"origin"\047" ; \
#       print dest $NF ; }' |
# xargs -L 2 mv -v
