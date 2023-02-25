#!/usr/bin/env bash
# install current features
# usage: ./install.sh git@github.com:Jeremie-Chauvel/chezmoi.git
set -eo pipefail
IFS=$'\n\t'

readonly chezmoi_repository_arg=$1
set -u
sudo -v

source ./install/packages.sh
source ./install/chezmoi.sh "$chezmoi_repository_arg"
source ./install/tldr.sh
source ./install/kitty.sh
source ./install/ulauncher.sh
source ./install/fnm.sh
source ./install/github-cli.sh
source ./install/brave.sh
source ./install/gimp.sh
source ./install/flameshot.sh
source ./install/redshift.sh
source ./install/httpie.sh
source ./install/xclip.sh
source ./install/aspell.sh
#source ./install/i3.sh
source ./install/clementine.sh
source ./install/polybar.sh
source ./install/docker.sh
source ./install/zsh-plugins.sh
source ./config/update-max-user-watches.sh
source ./config/disable-instant-shutdown-power-button.sh
source ./install/vscode.sh
source ./install/pipenv.sh
source ./install/go.sh
source ./install/light.sh
source ./install/dmenu-xrandr.sh
source ./install/mkcert.sh
source ./install/screen-recording.sh
source ./install/keepass.sh
source ./install/grub-customizer.sh
source ./install/appImages-launcher.sh
source ./install/bat.sh
source ./install/delta.sh
source ./install/jenv.sh
source ./install/yq.sh
source ./install/task.sh
source ./install/insomnia.sh
source ./install/shellcheck.sh
source ./install/aws.sh

sudo apt autoremove --yes
