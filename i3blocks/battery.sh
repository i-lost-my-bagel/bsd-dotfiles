#!/usr/bin/env bash

switchBatteryMode () {
	if [ $BAT_MODE == "0" ]; then
		echo 1 > /tmp/.bat
		export BAT_MODE=1
	elif [ $BAT_MODE == "1" ]; then
		echo 0 > /tmp/.bat
		export BAT_MODE=0
	fi
}

printBatteryInfo () {
	if [ $BAT_MODE == "0" ]; then
		echo "BAT: $(sysctl -n hw.acpi.battery.life)%"
	else
		if [ $(sysctl -n hw.acpi.battery.time) == "-1" ]; then
			echo Charging
		else
			echo "Time Remaining: $(sysctl -n hw.acpi.battery.time | awk '{printf("%02d:%02d\n",($1/60%60),($1%60))}')"
		fi
	fi
}

if test -f /tmp/.bat; then
	echo 1 > /dev/null
else
	echo 0 > /tmp/.bat
fi

BAT_MODE=$(cat /tmp/.bat)

case $BLOCK_BUTTON in
	1) switchBatteryMode ;;
esac

printBatteryInfo
