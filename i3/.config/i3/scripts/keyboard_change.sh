#!/bin/bash

key=$(setxkbmap -query | awk '
    BEGIN{layout="";variant=""}
    /^layout/{layout=$2}
    /^variant/{variant=" ("$2")"}
    END{printf("%s%s ",layout,variant)}')

if [ $key == "de" ] || [ $key == "de,gb" ]; then
	setxkbmap -layout gb
elif [ $key == "gb" ]; then
	setxkbmap -layout de
fi
