#!/bin/bash
yo=$(whoami)
#URL='http://oiswww.eumetsat.org/IPPS/html/latestImages/EUMETSAT_MSG_RGB-naturalcolor-all.jpg'
URL='http://oiswww.eumetsat.org/IPPS/html/MSG/RGB/NATURALCOLOR/WESTERNEUROPE/IMAGESDisplay/cIIITaNAkFGqm'
IMG='/tmp/desktop-raw.jpg'
wget $URL -O $IMG
# TODO recuperar el tamaño de la imagen y quitar la ultima banda de 25 pix de alto
convert $IMG -crop 1300x775+0+0 /tmp/escritorio.jpg
gsettings set org.gnome.desktop.background picture-uri "file:///tmp/escritorio.jpg"
