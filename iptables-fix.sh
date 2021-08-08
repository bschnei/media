#!/bin/bash
# https://gist.github.com/PedroLamas/db809a2b9112166da4a2dbf8e3a72ae9

# add a rule to iptables so the true ip address of clients flows
# through to docker containers. pihole and authelia use this info

currentAttempt=0
totalAttempts=10
delay=15

while [ $currentAttempt -lt $totalAttempts ]
do
	currentAttempt=$(( $currentAttempt + 1 ))
	
	echo "Attempt $currentAttempt of $totalAttempts..."
	
	result=$(iptables-save)

	if [[ $result =~ "-A DOCKER -i docker0 -j RETURN" ]]; then
		echo "Docker rules found! Modifying..."
		
		iptables -t nat -A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER
		
		echo "Done!"
		
		break
	fi
	
	echo "Docker rules not found! Sleeping for $delay seconds..."
	
	sleep $delay
done
