#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ../util/install-lib.sh

if is_def zsh; then
	link_config . ~/.config/zsh
  link_config zshenv ~/.zshenv
  get_package powerlevel10k https://github.com/romkatv/powerlevel10k.git v1.20.0

	# Change user shell to zsh
	chsh -s $(which zsh)
fi
