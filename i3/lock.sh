#!/usr/bin/env bash

icon="/home/heliumk/Downloads/lock.png"
tmpbg="/home/heliumk/Downloads/screen.png"

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% -gaussian-blur 0x3 "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
