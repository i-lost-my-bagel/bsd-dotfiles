#!/usr/bin/env bash

echo "$(backlight)%"

 case $BLOCK_BUTTON in
   4) backlight incr 3 ;; # scroll up, increase
   5) backlight decr 1 ;; # scroll down, decrease
 esac
