#!/usr/bin/python
import feedparser
import urllib2
import os


# Musica Antigua: 23353
# Grandes ciclos: 1984

proxy = urllib2.ProxyHandler( {"http":"http://80.193.214.231:3128/"} )
opener = urllib2.build_opener(proxy)
urllib2.install_opener(opener)
a = feedparser.parse('http://downloads.bbc.co.uk/podcasts/radio3/earlymusic/rss.xml', handlers = [proxy])
for e in a.entries:
    filename = e.title_detail.value + '.mp3'
    filename = filename.replace("/","-")
    if not os.path.exists(filename):
        for link in e.links:
            if link.type == 'audio/mpeg':
                print "[%s -- %s]" % (e.title_detail.value,link.href)
                response = urllib2.urlopen(link.href)
                #response = proxy.urlopen(link.href)
                localfile = open(filename, 'w')
                localfile.write(response.read())
                print "Escribiendo %s ..." % filename
                localfile.close()
    else:
        print "Omitiendo %s porque ya existe" % filename
