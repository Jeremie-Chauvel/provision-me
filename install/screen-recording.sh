#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo apt install vokoscreen audacity --yes
sudo apt install --reinstall libid3tag0
