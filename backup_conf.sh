#!/bin/bash
if [ ! -d "/mnt/usb/lost+found" ]; then
  echo 'missing devise on the path /mnt/usb'
  exit 1
fi
echo 'loading...'

#loading big directory
tar -czPf /home/alibebrochka/code_save.tar.gz /home/alibebrochka/code_save ||
  {
    echo 'tar-FAILS'
    exit 1
  }
mv -v /home/alibebrochka/code_save.tar.gz /mnt/usb
tar -czPf /home/alibebrochka/music.tar.gz /home/alibebrochka/music ||
  {
    echo 'tar-FAILS'
    exit 1
  }
mv -v /home/alibebrochka/music.tar.gz /mnt/usb

#loading directory
cp -vr /home/alibebrochka/books /mnt/usb
cp -vr /home/alibebrochka/applications /mnt/usb
cp -vr /home/alibebrochka/Documents/"Obsidian Vault" /mnt/usb

#loading files
cp -v /home/alibebrochka/.vimrc /mnt/usb
cp -v /home/alibebrochka/.config/i3/config /mnt/usb
cp -v /home/alibebrochka/.mutt/muttrc /mnt/usb
cp -v /home/alibebrochka/.config/sakura/sakura.conf /mnt/usb
cp -v /home/alibebrochka/.bash_aliases /mnt/usb
cp -v /home/alibebrochka/.dircolors /mnt/usb
cp -v /home/alibebrochka/.rtorrent.rc /mnt/usb
cp -v /home/alibebrochka/Documents/shosiy.7z
cp -v /etc/i3status.conf
echo 'finish'
