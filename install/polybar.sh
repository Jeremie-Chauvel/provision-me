#!/usr/bin/env bash
# this script install polybar compiling it from source

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist polybar

# cp config file
readonly polybar_config_dir="$HOME/.config/polybar"
if [[ ! -d "$polybar_config_dir" ]]; then
  mkdir -p "$polybar_config_dir"
fi
if [[ -f "$polybar_config_dir/config" ]]; then
  mv "$polybar_config_dir/config" "$polybar_config_dir/config.backup"
fi
ln -sr ./config "$polybar_config_dir"

# install dependencies
sudo apt install --yes build-essential git cmake cmake-data pkg-config python3-sphinx \
  libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev \
  libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev \
  libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev \
  libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev \
  libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

# download 3.4 polybar release
tmp_dir=$(mktemp -d -t polybar-install-XXXX)
cd "$tmp_dir"
git clone https://github.com/jaagr/polybar.git
cd polybar
git checkout 3.4.2 # version

# compile polybar
set +euo
./build.sh --i3 --pulseaudio --network --curl --auto
set -euo
sudo apt autoremove -y
cd
rm -rf "$tmp_dir"
