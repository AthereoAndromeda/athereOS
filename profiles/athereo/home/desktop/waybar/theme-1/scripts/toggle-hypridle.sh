#!/usr/bin/env bash

# Check if hypridle is running
hypridle_pid=$(pidof hypridle)

# If the process is running, kill it
if [[ $? -eq 0 ]]; then
  kill -TERM $hypridle_pid
  notify-send -a "Hypridle Widget" "Killed Hypridle"
  exit
else
  (hypridle &> /dev/null) &
  notify-send -a "Hypridle Widget" "Started Hypridle"
fi
