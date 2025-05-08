#!/usr/bin/env bash
# install current features
# usage: ./install.sh git@github.com:Jeremie-Chauvel/chezmoi.git
set -eo pipefail
IFS=$'\n\t'

readonly chezmoi_repository_arg=$1
set -u
sudo -v

#SHELL=zsh ujust bluefin-cli






# source ./install/nix.sh
source ./install/packages.sh
source ./install/atuin.sh
source ./install/chezmoi.sh $chezmoi_repository_arg
# source ./install/tldr.sh
source ./install/kitty.sh
# source ./install/ulauncher.sh
# source ./install/fnm.sh # brew
# source ./install/github-cli.sh
# source ./install/brave.sh # flathub automation
flatpak install --or-update --assumeyes flathub com.brave.Browser 
flatpak install --or-update --assumeyes flathub com.slack.Slack
flatpak install --or-update --assumeyes flathub com.spotify.Client
flatpak install --or-update --assumeyes flathub org.flameshot.Flameshot
# source ./install/gimp.sh
# source ./install/flameshot.sh


# source ./install/redshift.sh
# source ./install/httpie.sh # brew
# source ./install/xclip.sh # brew
# source ./install/aspell.sh
# #source ./install/i3.sh
# #source ./install/clementine.sh
# #source ./install/polybar.sh
# source ./install/docker.sh
source ./install/zsh-plugins.sh
# source ./config/update-max-user-watches.sh
# source ./config/disable-instant-shutdown-power-button.sh
source ./config/keymap-gnome.sh
# source ./install/vscode.sh
# source ./install/pipenv.sh
# source ./install/go.sh
# source ./install/light.sh
# source ./install/dmenu-xrandr.sh
# source ./install/mkcert.sh
# source ./install/screen-recording.sh
# source ./install/keepass.sh
# source ./install/grub-customizer.sh
# source ./install/appImages-launcher.sh
# source ./install/bat.sh 
# source ./install/delta.sh # brew
# source ./install/jenv.sh
# source ./install/yq.sh # brew
# source ./install/task.sh
# source ./install/insomnia.sh
# source ./install/shellcheck.sh
# source ./install/aws.sh

# sudo apt autoremove --yes
