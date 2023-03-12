#!/usr/bin/env bash
# disable switch workspace up/down that doesn't exist as an action in ubuntu 22 but breaks the keyboard shortcuts on vscode

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['disabled']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['disabled']"
