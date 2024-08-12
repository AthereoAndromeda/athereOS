#!/usr/bin/env bash
set -e

echo "System:"
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

