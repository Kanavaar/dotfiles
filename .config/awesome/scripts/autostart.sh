killall picom
killall dunst
killall sxhkd
# xwallpaper --maximize ~/pix/wallhaven-q29d2l_1920x1080_gruv.png
feh -r --bg-scale --randomize ~/pix/walls/*
picom &
dunst &
sxhkd &
xrandr --output DP-0 --mode 1920x1080 --rate 144