killall picom
killall dunst
killall sxhkd
feh -r --bg-scale --randomize ~/.config/walls/*
picom &
dunst &
sxhkd &
xrandr --output DP-0 --mode 1920x1080 --rate 144
