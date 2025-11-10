#!/bin/bash

books=$(find ~/ -maxdepth 2 -type d -name 'books')
music=$(find ~/ -maxdepth 2 -type d -name 'music')
Pictures=$(find ~/ -maxdepth 2 -type d -name 'Pictures')
videos=$(find ~/ -maxdepth 2 -type d -name 'videos')
appimages=$(find ~/ -maxdepth 2 -type d -name 'appimages')
rtorrent=$(find ~/.rtorrent -type d -name 'watch')

process_directory() {
    echo "inside the $1"
    for file in "$1"/*; do
        echo "$file"
        if [ -d "$file" ]; then
            process_directory "$file"
        fi
        if [ -f "$file" ]; then
            case "$file" in
            *.pdf)
                ~/applications/moveficon.sh "$file" "$books"
                ;;
            *.jpg)
                ~/applications/moveficon.sh "$file" "$Pictures"
                ;;
            *.fb2)
                ~/applications/moveficon.sh "$file" "$books"
                ;;
            *.fb2.zip)
                ~/applications/moveficon.sh "$file" "$books"
                ;;
            *.mp3)
                ~/applications/moveficon.sh "$file" "$music"
                ;;
            *.mp4)
                ~/applications/moveficon.sh "$file" "$videos"
                ;;
            *.m4a)
                ~/applications/moveficon.sh "$file" "$music"
                ;;
            *.appimage)
                ~/applications/moveficon.sh "$file" "$appimage"
                ;;
            *.AppImage)
                ~/applications/moveficon.sh "$file" "$appimage"
                ;;
            *.torrent)
                ~/applications/moveficon.sh "$file" "$rtorrent"
                ;;
            *.rar)
                unrar x -v "$file" "$1/tmp_dir"
                ;;
            *.7z)
                7z x "$file" -aoa -bsp1 -o"$1/tmp_dir"
                ;;
            *.zip)
                runzip "$file" && unzip "$file" -d "$1/tmp_dir"
                ;;
            *) ;;
            esac
        fi
    done
}

old=$(find ~/ -maxdepth 2 -type d -name 'Downloads')
mkdir -p "$old/tmp_dir"
process_directory "$old"
process_directory "$old/tmp_dir"
