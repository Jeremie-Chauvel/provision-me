#!/usr/bin/env bash
# install chrome
set -euox pipefail
IFS=$'\n\t'

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$SCRIPT_DIRECTORY/utils/early_exit_if_command_exist.sh"
early_exit_if_command_exist google-chrome

sudo apt install -y curl libxss1 libappindicator1 libindicator7

curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o ./google-chrome.deb
sudo apt install -y ./google-chrome.deb
rm ./google-chrome.deb

# Following is a way to provision extension on installation (however if you can I recommand just using chrome sync)

# # chrome extention in order of id:
# # Form Filler
# # JSON Viewer
# # URLColors
# # Vue.js devtools
# if [ ! -d /etc/opt/chrome/policies/managed ]; then
#   sudo mkdir -p /etc/opt/chrome/policies/managed
# fi
# ##! copy local file or
# echo '''
# {
#   "ExtensionSettings": {
#     "*": {
#       "installation_mode": "allowed"
#     },
#     "bnjjngeaknajbdcgpfkgnonkmififhfo": {
#       "installation_mode": "normal_installed",
#       "update_url":
#          "https://clients2.google.com/service/update2/crx"
#     },
#     "gbmdgpbipfallnflgajpaliibnhdgobh": {
#       "installation_mode": "normal_installed",
#       "update_url":
#          "https://clients2.google.com/service/update2/crx"
#     },
#     "jjccpcminoppplpmcfghflolejbdkekm": {
#       "installation_mode": "normal_installed",
#       "update_url":
#          "https://clients2.google.com/service/update2/crx"
#     },
#     "nhdogjmejiglipccpnnnanhbledajbpd": {
#       "installation_mode": "normal_installed",
#       "update_url":
#          "https://clients2.google.com/service/update2/crx"
#     }
#   }
# }
# ''' | sudo tee /etc/opt/chrome/policies/managed/tarkett_basic_chrome_extentions.json >/dev/null

# Add shortcut icons to desktop
cp /usr/share/applications/google-chrome.desktop ~/Desktop/chrome.desktop
chmod +x ~/Desktop/chrome.desktop
