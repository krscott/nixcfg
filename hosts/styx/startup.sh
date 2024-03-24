#!/usr/bin/env bash
#
# On host machine:
# ```
# ln -s "$PWD/my-startup.desktop" ~/.config/autostart/
# ```

set -eou pipefail
shopt -s failglob

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

distrobox enter ubuntu-nix -- bash -ic './fix-touch.sh'


