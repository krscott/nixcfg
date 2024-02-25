#!/usr/bin/env bash

# exit when any command fails
set -euo pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

function is_def {
	type "$1" >/dev/null 2>&1
}

function link_config {
	src="$1"
	dst="$2"
	echo "Linking $src"
	if [ -e "$dst" ]; then
		rm -rf "$dst"
	else
		mkdir -p "$(dirname "$dst")"
	fi
	ln -s "$(pwd)/$src" "$dst"
}

function get_package {
	name="$1"
	url="$2"
	tag="${3:-}"

	echo "Getting package $name: $url $tag"

	mkdir -p packages
	cd packages

	if [ ! -d "$name" ]; then
		if [ ! -z "$tag" ]; then
			git -c advice.detachedHead=false clone -q --depth 1 --branch "$tag" "$url" "$name"
		else
			git clone -q --depth 1 "$url" "$name"
		fi
	else
		cd "$name"
		if [ ! -z "$tag" ]; then
			git -c advice.detachedHead=false fetch -q --depth 1 origin tag "$tag" --no-tags
			git -c advice.detachedHead=false checkout -q "$tag"
		else
			git pull -q --depth 1
		fi
	fi
}

echo "Copying fonts"
mkdir -p ~/.local/share/fonts/
cp -r fonts/* ~/.local/share/fonts/

echo "Linking config files"
link_config nvim ~/.config/nvim
link_config kitty ~/.config/kitty

if is_def zsh; then
	link_config zsh ~/.config/zsh
	(
		cd zsh
		link_config zshenv ~/.zshenv
		get_package powerlevel10k https://github.com/romkatv/powerlevel10k.git v1.20.0
	)

	# Change user shell to zsh
	chsh -s $(which zsh)
fi

echo "Done"
