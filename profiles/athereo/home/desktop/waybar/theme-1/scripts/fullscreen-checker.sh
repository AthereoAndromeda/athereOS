#!/usr/bin/env sh
workit() {
  string=$1
  number=${string##*>>}
  echo "$number"
}

handle() {
  case $1 in
    # monitoradded*) echo test;;
    # focusedmon*) echo more ;;
    fullscreen*) workit $1 ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

