#!/usr/bin/env bash

pid=$(pidof wl-screenrec)

if [[ $? -ne 0 ]]; then
  (wl-screenrec -f ~/Pictures/screenrec.mp4 --audio &) &> /dev/null
  echo "󰑊"
else
  kill $pid
  echo ""
fi
