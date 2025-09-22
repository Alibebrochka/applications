#!/bin/bash
old="/home/alibebrochka/Downloads"
books=$(find ~/ -type d -name 'books')
music=$(find ~/ -type d -name 'music')
Videos=$(find ~/ -type d -name 'Videos')
rtorrent=$(find ~/.rtorrent -type d -name 'watch')
for file in ~/Downloads/*; do
    if [ -f "$file" ]; then
        case "$file" in
        *.pdf)
            ~/applications/rep_elem.sh $old *.pdf $books
            ;;
        *.fb2)
            ~/applications/rep_elem.sh $old *.fb2 $books
            ;;
        *.fb2.zip)
            ~/applications/rep_elem.sh $old *.fb2.zip $books
            ;;
        *.mp3)
            ~/applications/rep_elem.sh $old *.mp3 $music
            ;;
        *.mp4)
            ~/applications/rep_elem.sh $old *.mp4 $Videos
            ;;
        *.torrent)
            ~/applications/rep_elem.sh $old *.torrent $rtorrent
            ;;
        *) ;;
        esac
    fi
done
