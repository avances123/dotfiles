#!/bin/bash
#URL='http://oiswww.eumetsat.org/IPPS/html/latestImages/EUMETSAT_MSG_RGB-naturalcolor-all.jpg'
#URL='http://oiswww.eumetsat.org/IPPS/html/MSG/RGB/NATURALCOLOR/WESTERNEUROPE/IMAGESDisplay/cIIITaNAkFGqm'
cd /tmp/
URL='http://oiswww.eumetsat.org/IPPS/html/MSG/RGB/NATURALCOLOR/WESTERNEUROPE/IMAGESDisplay/2FramesNATURALCOLOR-WESTERNEUROPE.zip'
ZIP='desktop-bg.zip'
curl -s $URL > $ZIP
IMG=$(unzip -l desktop-bg.zip  | awk '/-----/ {p = ++p % 2; next} p {print $NF}' | head -n 1)
unzip -o 'desktop-bg.zip' 2>/dev/null 1>&2
# TODO recuperar el tamaño de la imagen y quitar la ultima banda de 25 pix de alto
#convert $IMG -crop 1300x775+0+0 ~/escritorio.jpg
convert $IMG -crop 1680x1050+0+0 ~/escritorio.jpg
gsettings set org.gnome.desktop.background picture-uri "file:///home/fabio/escritorio.jpg" 2>/dev/null
#echo `date` $IMG
