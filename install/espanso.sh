#!/usr/bin/env bash
# install espanso
set -euo pipefail
IFS=$'\n\t'

# TODO wayland test
sudo apt install --yes curl
curl -fsSL https://github.com/federico-terzi/espanso/releases/download/v2.1.8/espanso-debian-wayland-amd64.deb -o ./espanso.deb
sudo apt install ./espanso.deb --yes
rm ./espanso.deb
sudo setcap "cap_dac_override+p" $(which espanso)
espanso service register
espanso start
