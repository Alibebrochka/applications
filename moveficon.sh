#!/bin/bash

fill="$1"
newPath="$2"
#get base name
fileName=$(basename "$fill")
#replase " " with "_"
newFileName="${fileName// /_}"
#new path
destinationPath="${newPath}/${newFileName}"
mv -v "$fill" "$destinationPath"
