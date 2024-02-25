#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ../util/install-lib.sh

if is_def zsh; then
	link_config . ~/.config/tmux
	packages_dir="plugins" get_package tpm https://github.com/tmux-plugins/tpm
fi
