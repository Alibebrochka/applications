#!/bin/bash
old="/home/alibebrochka/Downloads/"
for file in ~/Downloads/*; do
    if [ -f "$file" ]; then
        case "$file" in 
	*.pdf)
                ~/applications/rep_elem.sh $old *.pdf ~/books/
    ;;
	*.fb2)
                ~/applications/rep_elem.sh $old *.fb2 ~/books/
   	;;
	*.mp3)
                ~/applications/rep_elem.sh $old *.mp3 ~/music/
	;;
	*.mp4)
                ~/applications/rep_elem.sh $old *.mp4 ~/Videos/
	;;
	*.torrent)
                ~/applications/rep_elem.sh $old *.torrent ~/.rtorrent/watch/
	;;
		*)
        ;;
        esac
    fi
done


