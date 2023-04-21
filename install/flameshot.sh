#!/usr/bin/env bash
# install flameshot a screenshot capture tool
set -euo pipefail
IFS=$'\n\t'

# troubleshoot https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist/f8d89b8a2f9d61ba318c8be075b46de230c7d97e
sudo apt install flameshot xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
# shotcut to setup in your dotfiles:
# flameshot gui
# eg for sway/i3: `bindsym Print exec flameshot gui``
