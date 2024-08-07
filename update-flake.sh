#!/usr/bin/env bash

set -eou pipefail

is_git_dirty() {
	test -n "$(git status --porcelain)"
}

if is_git_dirty; then
	echo "Git is dirty. Commit or stash changes first."
	exit 1
fi

nix flake update

if is_git_dirty; then
	git add flake.nix
	git commit -m "Update flake.nix"
else
	echo "Flake already up-to-date"
fi
