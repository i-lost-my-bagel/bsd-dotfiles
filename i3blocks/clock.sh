#!/usr/bin/env bash

switchClockMode () {
	if [ $CLOCK_MODE == "0" ]; then
		echo 1 > /tmp/.clock
		export CLOCK_MODE=1
	elif [ $CLOCK_MODE == "1" ]; then
		echo 0 > /tmp/.clock
		export CLOCK_MODE=0
	fi
}

printClock () {
	if [ $CLOCK_MODE == "0" ]; then
		date +'%-l:%M %p'
	else
		date +'%Y-%m-%d'
	fi
}

if test -f /tmp/.clock; then
	echo 1 > /dev/null
else
	echo 0 > /tmp/.clock
fi

CLOCK_MODE=$(cat /tmp/.clock)

case $BLOCK_BUTTON in
	1) switchClockMode ;;
esac

printClock
