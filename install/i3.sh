#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

readonly i3_config_dir="$HOME/.config/i3"
sudo apt install -y i3 i3status i3lock dmenu xautolock slop gifsicle \
  pulseaudio-utils eog ffmpeg scrot curl

# feh
sudo apt remove --purge -y libimlib2 libimlib2-dev
sudo apt install -y libimlib2 libimlib2-dev feh

# keyboard layout
set +e
sudo apt list --installed | grep 'xkb-qwerty' -q
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  curl -O http://marin.jb.free.fr/qwerty-fr/xkb-qwerty-fr_0.5_all.deb
  sudo dpkg --install ./xkb-qwerty-fr_0.5_all.deb
  rm xkb-qwerty-fr_0.5_all.deb
fi
if [[ ! -d "$HOME/.i3" ]]; then
  mkdir "$HOME/.i3"
fi

if [[ ! -d "$HOME/.i3/i3-volume" ]]; then
  git clone https://github.com/hastinbe/i3-volume.git "$HOME/.i3/i3-volume"
fi

set +e
hash i3lock 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  # install i3lock-fancy
  bash -c "$(curl -sSL https://raw.githubusercontent.com/Jeremie-Chauvel/i3lock-fancy/master/install.sh)"
fi
