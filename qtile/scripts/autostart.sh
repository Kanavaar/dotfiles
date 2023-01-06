#!/bin/bash

killall picom
killall dunst

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

xrandr --output DP-0 --mode 1920x1080 --rate 144
#start mpd
[ ! -s ~/.config/mpd/pid ] && mpd &

setxkbmap -option ctrl:nocaps &
clipmenud &
numlockx &

#starting utility applications at boot time
picom --vsync &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &

# xwallpaper --maximize ~/pix/wallhaven-q29d2l_1920x1080_gruv.png
feh -r --bg-scale --randomize ~/pix/walls/*.png
dunst &
