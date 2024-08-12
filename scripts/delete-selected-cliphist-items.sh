#!/usr/bin/env bash

cliphist list | fzf --multi | cliphist delete
