#!/usr/bin/env bash

playerctl metadata xesam:title > /dev/null
if [ $? -ne 0 ] ; then
	echo "no media playing"
else
	echo "$(playerctl metadata xesam:title) - $(playerctl metadata xesam:album) | $(playerctl metadata xesam:artist)"
fi
