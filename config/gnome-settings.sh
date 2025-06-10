#!/usr/bin/env bash
# setup some keybindings for ubuntu

if [[ "gnome" != "$DESKTOP_SESSION" ]]; then
  echo "not on Gnome, skipping"
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
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-down" "['<Primary><Super>Down', '<Primary><Super>j']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-left" "['<Super>Left']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-right" "['<Super>Right']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-up" "['<Primary><Super>Up', '<Primary><Super>k']"

# #qwerty
# gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-1" "['<Shift><Super>y']"
# gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-2" "['<Shift><Super>u']"
# gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-3" "['<Shift><Super>i']"
# gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-4" "['<Shift><Super>o']"
# gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-last" "['<Shift><Super>p']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-1" "['<Super>y']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-2" "['<Super>u']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-3" "['<Super>i']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-4" "['<Super>o']"
# gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-last" "['<Super>p']"

# azerty
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-1" "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-2" "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-3" "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-4" "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-last" "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-1" "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-2" "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-3" "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-4" "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-last" "['<Super>5']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

# Keybind System monitor
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Shift><Control>Escape"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "flatpak run io.missioncenter.MissionCenter"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "mission-center"

# Keybind Kitty
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>t"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "/var/home/jeremiec/.local/kitty.app/bin/kitty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Kitty"

# Keybind flameshot
gsettings set org.gnome.shell.keybindings 'show-screenshot-ui' "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "print"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "flatpak run --command=flameshot org.flameshot.Flameshot gui"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Flatpak"
# pref
gsettings set org.gnome.desktop.interface accent-color 'blue'
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gtk.Settings.FileChooser clock-format '24h'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.peripherals.mouse double-click 250
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false

gsettings set org.gnome.desktop.wm.keybindings "switch-input-source" "['<Super>space']"
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.mutter workspaces-only-on-primary false

gnome-extensions disable 'tailscale@joaophi.github.com'
gnome-extensions disable 'gsconnect@andyholmes.github.io'
gnome-extensions disable 'dash-to-dock@micxgx.gmail.com'

gnome-extensions enable 'appindicatorsupport@rgcjonas.gmail.com'
gnome-extensions enable 'blur-my-shell@aunetx'
gnome-extensions enable 'logomenu@aryan_k'
gnome-extensions enable 'search-light@icedman.github.com'
gnome-extensions enable 'just-perfection-desktop@just-perfection'
gnome-extensions enable 'tilingshell@ferrarodomenico.com'
gnome-extensions enable 'wiggle@mechtifs'
gnome-extensions enable 'monitor-brightness-volume@ailin.nemui'
