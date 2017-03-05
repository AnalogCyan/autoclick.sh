#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

echo -- autoclick.sh --
sleep 1
echo --   ver. 2.0   --
sleep 1
echo This script is designed to be run on a Debian or Arch based system.
sleep 1
echo Open this script with a text editor to adjust settings.
sleep 1
echo There are comments in this script to assist you in adjusting settings.
sleep 1
echo Quckly [Alt-Tab] back to this window and [Ctrl-C] to quit the script. 
sleep 1
echo Ensuring xdotool is installed...
sleep 1

#check if pacman is installed, if it is use it to check if xdotool is instaled and install it if it isn't
#if command -v pacman >/dev/null; then
if which pacman >/dev/null; then
	if ! pacman -Qq | grep -qw xdotool; then
		echo -e "${RED}xdotool not found, installing, this may ask for your password...${NC}"
		sleep 2
		sudo pacman -Sy xdotool
	fi
#check if apt is installed, if it is use it to check if xdotool is instaled and install it if it isn't
#elif command -v apt >/dev/null; then
elif which apt >/dev/null; then
	if ! dpkg -l | grep -qw xdotool; then
		echo -e "${RED}xdotool not found, installing, this may ask for your password...${NC}"
		sleep 2
		sudo apt-get update
		sudo apt-get install xdotool
	fi
#if both pacman and apt couldn't be found, report error
else
	echo pacman or apt not found! exiting...
	sleep 5
	exit 1
fi

sleep 1
echo -e "${GREEN}This script will begin in 5 seconds...${NC}"
echo -e "Use ${WHITE}[Ctrl-C]${NC} in this terminal to quit."
sleep 5

# The code below is what does the actual clicking, only edit it when adjusting settings.

while [ 1 ]; do
  xdotool click 1 &
  sleep 5
done

# to adjust timings, change the '5' in the 'sleep 5' line to a time in seconds, note that it may be difficult to kill this script if the time is too short.

# change the number after 'xdotool ckick' to switch between left and right click.
# 1 = left, 3 = right
