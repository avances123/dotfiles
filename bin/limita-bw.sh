#capar el bandwith a 500 kilobytes por segundo

sudo tc qdisc add dev eth0 handle 1: root htb default 11
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 500kbps
sudo tc class add dev eth0 parent 1:1 classid 1:11 htb rate 500kbps



# Borrar reglas
#sudo tc qdisc del dev eth0 root
