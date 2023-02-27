#!/usr/bin/env bash
# this script install sway (window tiling manager wayland replacement for i3)

set -euo pipefail
IFS=$'\n\t'

nix-env -iA nixpkgs.sway
nix-env -iA nixpkgs.swaylock
nix-env -iA nixpkgs.wl-clipboard
nix-env -iA nixpkgs.way-displays
# if [[ ! -d "$HOME/.i3/i3-volume" ]]; then
#   git clone https://github.com/hastinbe/i3-volume.git "$HOME/.i3/i3-volume"
# fi

## TODO https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway

# set +e
# hash i3lock 2>/dev/null
# result_status="$?"
# set -e
# if [[ "$result_status" -gt 0 ]]; then
#   # install i3lock-fancy
#   bash -c "$(curl -sSL https://raw.githubusercontent.com/Jeremie-Chauvel/i3lock-fancy/master/install.sh)"
# fi
