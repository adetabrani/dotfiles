#!/usr/bin/env bash

wal -R
xdotool key super+F5
/usr/libexec/polkit-gnome-authentication-agent-1 &
clipmenud &
sxhkd &
picom &
redshift &
mpd &
# easyeffects --gapplication-service &
~/.fehbg &
dwmblocks &
systemctl --user import-environment DISPLAY
xrandr -s 2560x1440
