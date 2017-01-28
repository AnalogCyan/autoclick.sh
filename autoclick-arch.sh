#!/usr/bin/env bash

echo Open this script with a text editor to adjust settings.
sleep 1
echo There are comments in this script to assist you in adjusting settings.
sleep 1
echo Quckly [Alt-Tab] back to this window and [Ctrl-C] to quit the script. 
sleep 1
echo Ensuring xdotool is installed...
sleep 1

if ! pacman -Qq | grep -qw xdotool; then
    sudo pacman -S xdotool
fi

sleep 1
echo This script will begin in 5 seconds...
sleep 5

# The code below is what does the actual clicking, only edit it when adjusting settings.

while [ 1 ]; do
  xdotool click 1 &
  sleep 15
done

# to adjust timings, change the '5' in the 'sleep 5' line to a time in seconds, note that it may be difficult to kill this script if the time is too short.
