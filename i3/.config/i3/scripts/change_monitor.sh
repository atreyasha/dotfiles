#!/bin/bash

dp=$(xrandr | grep -e "DP" | cut -d " " -f 2 | grep -w "connected")
vga=$(xrandr | grep -e "VGA" | cut -d " " -f 2 | grep -w "connected")

if [ -z "$dp" ] && [ -z "$vga" ]; then
    ~/.screenlayout/home_1.sh
elif [ -z "$dp" ] && [ -n "$vga" ]; then
    ~/.screenlayout/home_2.sh
elif [ -n "$dp" ] && [ -z "$vga" ]; then
    ~/.screenlayout/home_2.sh
else
    xrandr --auto
fi
