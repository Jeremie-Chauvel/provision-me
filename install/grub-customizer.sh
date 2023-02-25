#!/usr/bin/env bash
# Install grub-customizer
set -euo pipefail
IFS=$'\n\t'
sudo add-apt-repository ppa:danielrichter2007/grub-customizer --yes
sudo apt install --yes grub-customizer
