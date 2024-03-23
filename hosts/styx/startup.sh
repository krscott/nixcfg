#!/usr/bin/env bash
#
# On host machine:
# ```
# ln -s "$PWD/my-startup.service" ~/.config/systemd/user/
# systemctl daemon-reload
# systemctl --user start my-startup
# ```

set -eou pipefail

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

distrobox enter ubuntu-nix -- bash -ic './fix-touch.sh'


