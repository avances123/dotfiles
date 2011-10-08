#!/bin/bash
wget http://oiswww.eumetsat.org/IPPS/html/MSG/RGB/NATURALCOLOR/FULLDISC/IMAGESDisplay/2FramesNATURALCOLOR-FULLDISC.zip -O /tmp/escritorio.zip
cd /tmp
IMG=$(unzip -o escritorio.zip | grep extracti| head -1 | cut -f3 -d' ')
convert $IMG -crop 800x775+0+0 /home/fa/escritorio.jpg
gconftool-2 --type string --set /desktop/gnome/background/picture_options scaled
gconftool-2 --type string --set /desktop/gnome/background/picture_filename /home/fa/escritorio.jpg

