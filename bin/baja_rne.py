#!/usr/bin/python
import feedparser
import urllib.request, urllib.error, urllib.parse
import os


# Musica Antigua: 23353
# Grandes ciclos: 1984

#a = feedparser.parse("http://www.rtve.es/api/programas/1984/audios.rss")
a = feedparser.parse("http://www.rtve.es/api/programas/23353/audios.rss")
for e in a.entries:
    filename = e.title_detail.value + '.mp3'
    filename = filename.replace("/","-")
    if not os.path.exists(filename):
        for link in e.links:
            if link.type == 'audio/mpeg':
                print("[%s -- %s]" % (e.title_detail.value,link.href))
                response = urllib.request.urlopen(link.href)
                localfile = open(filename, 'wb')
                localfile.write(response.read())
                print("Escribiendo %s ..." % filename)
                localfile.close()
    else:
        print("Omitiendo %s porque ya existe" % filename)
