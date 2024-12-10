#!/bin/sh

modeline=""
case "$1" in
    tv)
        modeline='141.45  1920 2032 2232 2544  1080 1081 1084 1112  -HSync +Vsync'
        ;;
    mon)
        modeline='109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync'
        ;;
    *)
        echo "Usage: $0 tv|mon" >&2
        exit 1
        ;;
esac

if  [ -v WAYLAND_DISPLAY ]
then
	swaymsg output "VGA-1 modeline $modeline"
	swaymsg output eDP-1 disable
	swaymsg output eDP-1 power off
else

	xrandr --newmode "$1" $modeline
	xrandr --addmode VGA-1 "$1"
	xrandr --output VGA-1 --mode "$1"
	
	polybar-msg cmd restart
	$HOME/.fehbg 

	xrandr --output eDP-1 --off
fi
