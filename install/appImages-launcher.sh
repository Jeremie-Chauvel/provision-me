#!/usr/bin/env bash
# this script install appimage launcher https://github.com/TheAssassin/AppImageLauncher

set -euo pipefail
IFS=$'\n\t'

sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo apt update
sudo apt install appimagelauncher -y
