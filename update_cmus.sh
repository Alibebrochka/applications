#!/bin/bash
music=$(find ~/ -type d -name 'music')
cmus-remote -C clear
cmus-remote -C "add $music"
cmus-remote -C "update-cache -f"
