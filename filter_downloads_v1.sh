#!/bin/bash

books=$(find ~/ -maxdepth 2 -type d -name 'books')
music=$(find ~/ -maxdepth 2 -type d -name 'music')
Pictures=$(find ~/ -maxdepth 2 -type d -name 'Pictures')
videos=$(find ~/ -maxdepth 2 -type d -name 'videos')
appimages=$(find ~/ -maxdepth 2 -type d -name 'appimages')
rtorrent=$(find ~/.rtorrent -type d -name 'watch')

pd_rm_rm() {
    process_directory "$1" && rm -r "$2"
    rm "$1"
}

process_directory() {
    for file in "$1"/*; do
        #echo "$file"
        if [ -d "$file" ]; then
            process_directory "$file"
        fi
        if [ -f "$file" ]; then
            case "$file" in
            *.pdf)
                ~/applications/rep_elem.sh "$1" *.pdf "$books"
                ;;
            *.jpg)
                ~/applications/rep_elem.sh "$1" *.jpg "$Pictures"
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
            *.rar)
                unrar x -v "$file" "$1" && pd_rm_rm "${file%.rar}" "$file"
                ;;
            *.7z)
                7z x "$file" -aoa -bsp1 -o"$1" && pd_rm_rm "${file%.7z}" "$file"
                ;;
            *) ;;
            esac
        fi
    done
}

old="/home/alibebrochka/Downloads"
process_directory "$old"
