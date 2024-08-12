#!/usr/bin/env bash

case "$1" in
preview)
    row="$2"
    if echo "$row" | grep -vqP '^\d+\t\[\[ binary data .* \]\]'; then
        echo "$row" | cliphist decode
    else
        echo "$row" | cliphist decode | chafa -f sixel -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"
    fi
    ;;

*)
    id="$(cliphist list | fzf -m --preview "$(realpath "$0") preview {}")"
    test -z "$id" && exit

    echo "Deleting Items"
    echo "$id"

    echo "$id" | cliphist delete
    ;;

esac
