#!/usr/bin/env bash

# cliphist setup
wl-paste --type text --watch cliphist store &  #Stores only text data

wl-paste --type image --watch cliphist store &  #Stores only image data

# init wallpaper daemon
# swww init &
# set wallpaper 
# swww img ~/.assets/wallpaper.png &

# Start mpvpaper instead. There is a waybar widget that allows toggling
# between mpvpaper or swww.
mpvpaper -vs -o "no-audio loop" '*' "$HOME/.assets/cat-lofi.mp4" &

# Topbar
# eww open bar -c ~/.config/eww/custom-bar/ &
sh  ~/.config/waybar/theme-1/launch-waybar.sh &


# sleep 3

# Auto Mount
udiskie &

# Idle management
# (hypridle &) && loginctl unlock-session # Patched issue. wait for new release (https://github.com/hyprwm/hypridle/issues/7)

# Notification Manager
# swaync

# nm-applet --indicator &
