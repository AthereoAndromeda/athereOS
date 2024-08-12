#!/usr/bin/env bash

HOME_ID=$(home-manager generations | grep -oP '(?<=id )\d+' | sort -n | tail -n 1)
GEN=`sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}'`
GEN_PARSED=$((GEN + 0))

echo "(sys: $GEN_PARSED, home: $HOME_ID)"
