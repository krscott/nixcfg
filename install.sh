#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"


function link_config() {
    src="$1"
    dst="$2"
    echo "Linking $src"
    if [ -e "$dst" ]; then
        rm -rf "$dst"
    fi
    ln -s "$(pwd)/$src" "$dst"
}


echo "Linking config files"

link_config nvim ~/.config/nvim

echo "Done"
