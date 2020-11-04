#!/bin/bash

check=$(nmcli radio wifi)

if [ $check = "disabled" ]; then
	nmcli radio wifi on
else
	nmcli radio wifi off
fi

pkill -SIGRTMIN+8 i3blocks
