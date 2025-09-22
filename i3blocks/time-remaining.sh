#!/usr/bin/env bash

if [ $(sysctl -n hw.acpi.battery.time) == "-1" ]; then
	echo Charging
else
	echo "Bat Life: $(sysctl -n hw.acpi.battery.time | awk '{printf("%02d:%02d\n",($1/60%60),($1%60))}')"
fi
