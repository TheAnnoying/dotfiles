#!/usr/bin/env sh
HYPRSTUDYMODE=$(hyprctl getoption general:gaps_out | awk 'NR==1{print $3}')
if [ "$HYPRSTUDYMODE" = 20 ] ; then
    pkill waybar
    pkill hyprpaper
    hyprctl --batch "\
        keyword decoration:active_opacity 1;\
        keyword decoration:inactive_opacity 1;\
        keyword blur:size 8;\
	keyword general:gaps_in 15;\
        keyword general:gaps_out 50"
    exit
fi
hyprctl reload
hyprpaper
waybar
