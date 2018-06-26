#!/bin/bash

#Author: Radio aka ThePunkGeek

# This is a shell script that randomly picks a NordVPN server to vpn into using openvpn
# Make sure to chmod 755 it so it can be executed

echo "random-vpn starting..."

#	variable for the path to where the ovpn files are:
location="/etc/openvpn/ovpn_tcp/us"

#	variable for the vpn command:
vpn="sudo openvpn --config "

# variable that finishes the file name
file=".nordvpn.com.tcp.ovpn"

# variable that will hold the server that is chosen picked from 323 to 2391:
server="$(python -S -c "import random; print( random.randrange(323,2391))")"

#loop until a server file exists
while [ ! -e "$location${server}$file" ]; do
  server="$(python -S -c "import random; print( random.randrange(323,2391))")"
done
# print the chosen server
echo "Chose server: $server"

# it it runs in the background with --daemon
command="$vpn$location${server}$file --daemon"

# to run the command 
$command
