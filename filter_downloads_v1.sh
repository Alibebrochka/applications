#!/bin/bash

books=$(find ~/ -type d -name 'books')
music=$(find ~/ -type d -name 'music')
videos=$(find ~/ -type d -name 'videos')
appimages=$(find ~/ -type d -name 'appimages')
rtorrent=$(find ~/.rtorrent -type d -name 'watch')

process_directory() {
    for file in "$1"/*; do
        echo "$file"
        if [ -d "$file" ]; then
            process_directory "$file"
        fi
        if [ -f "$file" ]; then
            case "$file" in
            *.pdf)
                ~/applications/rep_elem.sh "$1" *.pdf "$books"
                ;;
            *.fb2)
                ~/applications/rep_elem.sh "$1" *.fb2 "$books"
                ;;
            *.fb2.zip)
                ~/applications/rep_elem.sh "$1" *.fb2.zip "$books"
                ;;
            *.mp3)
                ~/applications/rep_elem.sh "$1" *.mp3 "$music"
                ;;
            *.mp4)
                ~/applications/rep_elem.sh "$1" *.mp4 "$videos"
                ;;
            *.appimage)
                ~/applications/rep_elem.sh "$1" *.appimage "$appimages"
                ;;
            *.AppImage)
                ~/applications/rep_elem.sh "$1" *.AppImage "$appimages"
                ;;
            *.torrent)
                ~/applications/rep_elem.sh "$1" *.torrent "$rtorrent"
                ;;
                #*.rar)
                #    unrar x $file
                #    rm -r $file
                #    ;;
            *) ;;
            esac
        fi
    done
}

old="/home/alibebrochka/Downloads"
process_directory "$old"
