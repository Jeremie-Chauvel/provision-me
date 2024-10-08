#!/usr/bin/env bash
# setup some keybindings for ubuntu

if (("Ubuntu" != $(lsb_release -si))); then
  echo "not on Ubuntu, skipping"
  exit 0
fi

# remove dash-to-dock binding super for nothing
for e in {1..10}; do
  gsettings set org.gnome.shell.extensions.dash-to-dock "app-ctrl-hotkey-$e" \[\]
  gsettings set org.gnome.shell.extensions.dash-to-dock "app-shift-hotkey-$e" \[\]
  gsettings set org.gnome.shell.extensions.dash-to-dock "app-hotkey-$e" \[\]
done

gsettings set org.gnome.desktop.wm.keybindings "close" "['<Shift><Super>a']"
gsettings set org.gnome.desktop.wm.keybindings "toggle-fullscreen" "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-down" "['<Primary><Super>Down', '<Primary><Super>j']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-left" "['<Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-right" "['<Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-up" "['<Primary><Super>Up', '<Primary><Super>k']"

#qwerty
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-1" "['<Shift><Super>y']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-2" "['<Shift><Super>u']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-3" "['<Shift><Super>i']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-4" "['<Shift><Super>o']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-last" "['<Shift><Super>p']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-1" "['<Super>y']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-2" "['<Super>u']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-3" "['<Super>i']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-4" "['<Super>o']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-last" "['<Super>p']"

# azerty
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-1" "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-2" "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-3" "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-4" "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-last" "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-1" "['<Super>ampersand']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-2" "['<Super>eacute']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-3" "['<Super>quotedbl']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-4" "['<Super>apostrophe']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-last" "['<Super>parenleft']"
