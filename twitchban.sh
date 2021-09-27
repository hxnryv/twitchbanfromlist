#!/bin/bash

SOURCE="$(dirname ${BASH_SOURCE[0]})/banlist.txt"
declare -i twitchBannedCount=0 

echo -n "Starting in 5 seconds..."
for i in seq 5; do
    sleep 1
    echo -n .
done
echo

while IFS="" read -r p || [ -n "$p" ]; do
    if [ "$p" == "BANLISTEND" ]; then
        echo "Everyone on the list has been banned!"
        exit 0
    fi
    xdotool type "/ban $p"
    xdotool key Return
    sleep 1
    if twitchBannedCount == 50; then
      sleep(5) //idk how much
      echo "I slept for 10 ms"
      twitchBannedCount = 0
    fi

((twitchBannedCount+=1))
done < "$SOURCE"