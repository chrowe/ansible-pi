#!/bin/bash

#hostname=$1

# Remove old entries for default RPi hostname in known_hosts
sed -i.bak '/raspberrypi.local/d' ~/.ssh/known_hosts

# Wait until a new RPi is online
printf "Waiting for a new RPi to show up on the network..."
until ping -c1 raspberrypi.local &>/dev/null; 
do
  printf '.'
done

# Run new pi setup script
ansible-playbook -i hosts new.yml 
#--extra-vars "hostname=$hostname"

ssh pi@raspberrypi.local

#echo "You can now connect to Node-RED at $hostname.local:1880"