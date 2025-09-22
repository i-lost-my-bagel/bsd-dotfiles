#!/usr/bin/env bash

if [ $(echo $(acpiconf -i0 | grep "Present rate" | sed "s/[^0-9]//g")) == 0 ] ; then
	echo "$(printf %.3f $(echo $(acpiconf -i1 | grep "Present rate" | sed "s/[^0-9]//g")/1000 | bc -l)) W"
else
	echo "$(printf %.3f $(echo $(acpiconf -i0 | grep "Present rate" | sed "s/[^0-9]//g")/1000 | bc -l)) W"
fi
