#!/bin/bash

# check for exact compton
test=$(pgrep -x picom)
# conditionals based on compton existence
if [ -z "$test" ]; then
	sleep 1.5
else
	pkill -x picom
fi
# launch compton
picom -b --config ~/.config/picom/picom.conf
