#!/usr/bin/env bash
# install clementine music player from source
set -euox pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist clementine

sudo apt install --yes build-essential cmake gettext libasound2-dev \
  libboost-dev libcdio-dev libchromaprint-dev libdbus-1-dev libfftw3-dev \
  libglew1.5-dev libglib2.0-dev libgpod-dev libgstreamer-plugins-base1.0-dev \
  libgstreamer1.0-dev liblastfm5-dev libmtp-dev libprotobuf-dev libpulse-dev \
  libqt5x11extras5-dev libsqlite3-dev libtag1-dev pkg-config protobuf-compiler \
  qtbase5-dev qttools5-dev-tools qttools5-dev libsparsehash-dev ssh

readonly tmp_dir=$(mktemp -d)
cd "$tmp_dir"
git clone --depth 1 --branch 1.4.0rc1 https://github.com/clementine-player/Clementine.git
cd Clementine/bin
cmake ..
make -j8
sudo make install

rm -rf "$tmp_dir"
sudo apt autoremove --yes
