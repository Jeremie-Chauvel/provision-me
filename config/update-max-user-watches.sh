#!/usr/bin/env bash
# update max user watches for vscode
set -euo pipefail
IFS=$'\n\t'

readonly current_max_watches=$(</proc/sys/fs/inotify/max_user_watches)
if [[ "$current_max_watches" -lt 524288 ]] && grep -q -v -e 'fs.inotify.max_user_watches=524288' /etc/sysctl.conf; then
  echo 'fs.inotify.max_user_watches=524288' | sudo tee --append /etc/sysctl.conf
  sudo sysctl -p
fi
