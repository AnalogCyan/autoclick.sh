#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear
echo "-- autoclick.sh - ver. 2.2.0 --"
echo " "
sleep 1
echo This script is designed to be run on a Debian or Arch based system.
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

sleep 2
clear
echo "-- autoclick.sh - ver. 2.2.0 --"
echo " "
echo "What mouse button would you like pressed?"
echo "1 (left), 2 (middle), or 3 (right). "
read mouse
sleep 1
clear
echo "-- autoclick.sh - ver. 2.2.0 --"
echo " "
echo "How long between each mouse press (in seconds)? "
read clock

sleep 1
clear
echo "-- autoclick.sh - ver. 2.2.0 --"
echo " "
echo -e "${GREEN}This script will begin in 5 seconds with these settings:${NC}"
echo "Mouse: $mouse  Delay: $clock"
echo -e "Use ${WHITE}[Ctrl-C]${NC} in this terminal to quit."
sleep 5

# The code below is what does the actual clicking.

while [ 1 ]; do
    xdotool click $mouse &
    sleep $clock
done

# The variable $mouse controls what mouse button is pressed.
# The bariable $clock controls how long (in seconds) between each button press.
# Note that it may be difficult to kill this script if the time is too short.
