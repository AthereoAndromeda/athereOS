#!/usr/bin/env sh

# [body] markup:
# https://specifications.freedesktop.org/notification-spec/latest/ar01s04.html

# swaync-client -C
swaync-client -rs
swaync-client -R
# swaync-client -t

# -u critical
# -t 5000
# notify-send "Test noicon notification" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut mauris quis ante bibendum ..."
notify-send -u low "Low crit" "test info"
notify-send "Test normal notification." " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut mauris quis ante bibendum ..."
notify-send -u critical "Test critical notification." " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut mauris quis ante bibendum ..."
