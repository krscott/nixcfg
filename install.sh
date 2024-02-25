#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source util/install-lib.sh

echo "Linking config files"
link_config nvim ~/.config/nvim
link_config kitty ~/.config/kitty

bash zsh/install.sh

echo "Done"
