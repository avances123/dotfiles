#!/usr/bin/python
from pydub import AudioSegment
import sys
import argparse


parser = argparse.ArgumentParser(description='Sube el volumen a un mp3 (ideal para los podcasts cuando vamos a hacer deporte)')
parser.add_argument('file_orig', help='Fichero origen')
#parser.add_argument('file_dest', help='Fichero destino')
parser.add_argument('--db',metavar='dB', type=int,default=6,help='Numero de decibelios a subir')
args = parser.parse_args()


print "Abriendo %s" % args.file_orig
x = AudioSegment.from_mp3(args.file_orig)

print "Sumando %s dB al original.." % args.db
y = x + args.db

print "Convirtiendo al fichero %s" % args.file_orig
y.export(args.file_orig,format="mp3")




