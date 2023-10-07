#!/bin/bash

#Rename with the name of the file containing the new mirrors, 
#make sure you're in the same network as your raspberrys and you replace the "ipn" 
#to the corresponding ips, without removing the "", and replace the "user" for the 
#actual name of the user in your devices, in our case, it's the same for all our 7 devices so it can work
NEW_SOURCES_FILE="newsources.list"

TURTLEBOT_HOSTS=("ip1" "ip2" "ip3" "ip4" "ip5" "ip6" "ip7")

for HOST in "${TURTLEBOT_HOSTS[@]}"; do
    scp $NEW_SOURCES_FILE user@$HOST:/tmp/$NEW_SOURCES_FILE

    ssh user@$HOST "sudo cp /tmp/$NEW_SOURCES_FILE /etc/apt/sources.list"

    ssh user@$HOST "rm /tmp/$NEW_SOURCES_FILE"

    echo "Updated en $HOST"
done

