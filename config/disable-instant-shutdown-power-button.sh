#!/usr/bin/env bash
# disable intant shutdown on power button press
set -euo pipefail
IFS=$'\n\t'

sudo sed -i 's/#HandlePowerKey=poweroff/HandlePowerKey=ignore/' /etc/systemd/logind.conf
