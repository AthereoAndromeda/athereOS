#!/usr/bin/env bash

val=$(notify-send --action "move_to_dir=Open (xdg)" --action "yazi=Open (yazi)" "Screenshot Saved")

case $val in 
  "move_to_dir")
    xdg-open ~/Pictures
    ;;

  "yazi")
    foot yazi ~/Pictures
    ;;
esac


