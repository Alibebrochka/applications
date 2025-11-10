#!/usr/bin/env bash

target="$2"
tag="$1"

for file in *; do
    # перевіряємо що це файл, а не директорія
    [ -f "$file" ] || continue

    # витягуємо лише значення тегу Album
    album=$(exiftool $tag -s3 "$file" 2>/dev/null)

    if [[ "$album" == "$target" ]]; then
        echo "$file"
    fi
done
