#!/usr/bin/env bash
# -*- mode: shell-script -*-
# vim: syntax=sh

# define useful variables
userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"

# merge in defaults and keymaps
if [ -f "$sysresources" ]; then
  xrdb -merge "$sysresources"
fi

if [ -f "$sysmodmap" ]; then
  xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d "/etc/X11/xinit/xinitrc.d" ] ; then
  for filename in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$filename" ] && . "$filename"
  done
  unset filename
fi

# start user's X programs
feh-background &
unclutter --timeout 1 &
xset s off
xset dpms 300 0 0

# disable autorepeat for volume keys
# NOTE: keycodes found by disabling volume bindings in i3
# and then using xev to isolate specific keycodes
seq 121 123 | xargs -n 1 xset -r

# launch i3
exec i3
