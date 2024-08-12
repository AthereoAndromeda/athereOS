#!/usr/bin/env bash


# Check if swww-daemon is running
swww_pid=$(pidof swww-daemon)

# If the process is running, kill it
if [[ $? -eq 0 ]]; then
  kill -TERM $swww_pid
  mpvpaper -vs -o "no-audio loop" '*' "$HOME/.assets/cat-lofi.mp4" &
  exit
fi

# Check if mpvpaper is running
mpvpapver_pid=$(pidof mpvpaper)
if [[ $? -eq 0 ]]; then
    kill -TERM $mpvpapver_pid
    swww-daemon &
    exit
fi

# If neither are running, default to mpvpaper
mpvpaper -vs -o "no-audio loop" '*' "$HOME/.assets/cat-lofi.mp4" &
