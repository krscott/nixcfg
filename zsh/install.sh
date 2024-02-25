#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

source ../util/install-lib.sh

if is_def zsh; then
	link_config . ~/.config/zsh
  link_config zshenv ~/.zshenv
  get_package zap https://github.com/zap-zsh/zap.git "1.2.1"

	# Change user shell to zsh
	#chsh -s $(which zsh)
fi
