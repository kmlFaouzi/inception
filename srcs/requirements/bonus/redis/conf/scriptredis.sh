#!/bin/sh


#declare an init system to manage Redis as a service (systemd init system)
#A software suite that provides an array of 
#system components for Linux[6] operating systems
sed -i 's/supervised no/supervised systemd/g' /etc/redis/redis.conf
sed -i 's/daemonize yes/daemonize no/g' /etc/redis/redis.conf
sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
sed -i "s/# maxmemory <bytes>/maxmemory 20mb/g"  /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

redis-server --protected-mode no