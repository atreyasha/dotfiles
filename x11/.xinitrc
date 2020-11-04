feh --bg-fill ~/.backgrounds/ubuntu-16-04-lts-xenial-xerus-default-wallpapers-revealed-gallery-502692-3_2.jpg 
xset dpms 300 300 300
setxkbmap -layout de
unclutter --timeout 1 &
seq 121 123 | xargs -n 1 xset -r
exec i3
