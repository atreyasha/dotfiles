feh --bg-fill '/home/shankar/.backgrounds/trippy-background.jpg'
xset dpms 300 300 300
setxkbmap -layout de
unclutter --timeout 1 &
seq 121 123 | xargs -n 1 xset -r
exec i3
