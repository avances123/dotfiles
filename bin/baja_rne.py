#!/bin/python
import feedparser
import urllib2
import os


#a = feedparser.parse("http://www.rtve.es/podcast/radio-clasica/grandes-ciclos/SGRACI.xml")
#a = feedparser.parse("http://www.rtve.es/podcast/radio-clasica/musica-antigua/SMUANTI.xml")
a = feedparser.parse("http://www.rtve.es/api/programas/23353/audios.rss")
for e in a.entries:
    filename = e.title_detail.value + '.mp3'
    filename = filename.replace("/","-")
    if not os.path.exists(filename):
        for link in e.links:
            if link.type == 'audio/mpeg':
                print "[%s -- %s]" % (e.title_detail.value,link.href)
                response = urllib2.urlopen(link.href)
                localfile = open(filename, 'w')
                localfile.write(response.read())
                print "Escribiendo %s ..." % filename
                localfile.close()
    else:
        print "Omitiendo %s porque ya existe" % filename