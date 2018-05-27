#!/bin/sh

EXTERNAL="$1"

activeOutput=$(xrandr | grep -e " connected [^(]" | sed -e 's/\([A-Z0-9]\+\) connected.*/\1/' | cut -w -f 1)

if [ "${activeOutput#*$EXTERNAL}" = "$activeOutput" ]
then
	xrandr --output "$EXTERNAL" --auto
	xset -dpms
else
	xrandr --output "$EXTERNAL" --off

fi
