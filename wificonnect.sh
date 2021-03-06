#!/bin/sh -

printf "Checking if we are connected to the internet via a google ping...\n\n"
if curl --silent --head http://www.google.com/  |egrep "20[0-9] Found|30[0-9] Found" >/dev/null; 
then
  	printf "\nconnected to internet, skipping wifi-connect\n\n"
else
  	printf "\nnot connected, starting wifi-connect\n\n"
  	# Launch resin-wifi-connect, the --clear true will tell to always
	# clear any active or already setup connections on start up.
	resin-wifi-connect --clear=true --ui-path=/usr/src/rwc/public
fi
