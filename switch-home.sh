#!/usr/bin/env bash

set -eou pipefail

SYSTEM=$(nix eval --impure --raw --expr 'builtins.currentSystem')

nix run nixpkgs#home-manager -- switch --flake ."#$USER@$SYSTEM"

