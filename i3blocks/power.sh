#!/usr/bin/env bash

switchPowerMode () {
	if [ $(powerctl get) == "power-saver" ]; then
		powerctl set balanced > /dev/null
	elif [ $(powerctl get) == "balanced" ]; then
		powerctl set power-saver > /dev/null
	fi	
}

echo "$(powerctl get)"

 case $BLOCK_BUTTON in
	 1) switchPowerMode ;;
 esac
