#!/bin/bash

for i in 1 2 3 4;do
	DATE=$(date +"%Y-%m-%d_%H%M%S")
	#fswebcam -r 1280x720  --no-banner /home/fabio/serpiente/$DATE.jpg
	fswebcam -r 1280x720  --jpeg 100 -D 3 -S 13 /home/fabio/serpiente/$DATE.jpg
	cp -p /home/fabio/serpiente/$DATE.jpg /mnt/fa-disco/serpiente/$DATE.jpg && cp -f /mnt/fa-disco/serpiente/$DATE.jpg /mnt/fa-disco/serpiente/current.jpg
	sleep 13
done
