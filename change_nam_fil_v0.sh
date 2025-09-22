#!/bin/bash

find $1 -maxdepth 1 -type d \
    | awk -F'_' '\
    {print "\047"$0"\047" ; \
        print $1 ; }' \
    | xargs -L 2 mv -v

