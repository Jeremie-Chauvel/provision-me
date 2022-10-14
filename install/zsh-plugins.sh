#!/usr/bin/env bash
# here, I only install zsh
set -euo pipefail
IFS=$'\n\t'

sudo apt install --yes zsh git curl wget

# install oh my zsh
if [ ! -d ${HOME}/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh --keep-zshrc
  # oh my zsh is installed
  sudo chsh "$USER" -s $(which zsh)
fi

# ZSH plugins
readonly zsh_plugin_folder=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

add_plugin_from_git() {
  set +u
  local readonly plugin_directory=$1
  local readonly plugin_url=$2
  set -u
  if [ -d "${zsh_plugin_folder}/${plugin_directory}" ]; then
    cd "${zsh_plugin_folder}/${plugin_directory}"
    git checkout master
    git pull
  else
    git clone "$plugin_url" "${zsh_plugin_folder}/${plugin_directory}"
  fi
}
add_plugin_from_git 'zsh-autosuggestions' 'https://github.com/zsh-users/zsh-autosuggestions'
add_plugin_from_git 'zsh-syntax-highlighting' 'https://github.com/zsh-users/zsh-syntax-highlighting.git'
add_plugin_from_git 'auto-notify' 'https://github.com/MichaelAquilina/zsh-auto-notify.git'
add_plugin_from_git 'fzf-tab' 'https://github.com/Aloxaf/fzf-tab.git'
add_plugin_from_git 'yarn-completion' 'https://github.com/buonomo/yarn-completion'

# Install oh my zshrc
readonly powerlevel10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d ${HOME}/.oh-my-zsh ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # oh my zsh is installed
  sudo chsh "$USER" -s $(which zsh)
fi

if [ -d "$powerlevel10k_dir" ]; then
  cd "$powerlevel10k_dir"
  git fetch
  git reset origin/master --hard
else
  git clone https://github.com/romkatv/powerlevel10k.git "$powerlevel10k_dir"
fi
# font
set +e
fc-list : family | grep -e "Hack Nerd Font"
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip --no-check-certificate
  mkdir hack
  unzip Hack.zip -d hack
  sudo mv hack /usr/share/fonts/truetype
  sudo chown -R root:root /usr/share/fonts/truetype/hack
  sudo chmod -R g-w /usr/share/fonts/truetype/hack
  fc-cache -f -v
  rm Hack.zip
fi

# load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
set +e
hash rbenv 2>/dev/null
result_status="$?"
set -e
# install rbenv
if [[ "$result_status" -gt 0 ]]; then
  rm -rf "$HOME/.rbenv"
  sudo apt install -y build-essential libssl-dev zlib1g-dev libreadline-dev
  git clone git://github.com/sstephenson/rbenv.git "$HOME/.rbenv"
  git clone git://github.com/sstephenson/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

  set +e
  grep -q ~/.zshrc -e "rbenv init -"
  result_status="$?"
  set -e
  if [[ "$result_status" -gt 0 ]]; then
    echo '''
# rbenv -> ruby version manager
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
''' | tee --append ~/.zshrc >/dev/null
  fi
fi

eval "$(rbenv init -)"
# install a ruby version if needed
set +e
result_status="$(rbenv versions | wc -l)"
set -e
if [[ "$result_status" -eq 0 ]]; then
  rbenv install 2.6.0-rc2
  rbenv rehash
fi
echo '''
install: --no-ri --no-rdoc
update:  --no-ri --no-rdoc
''' | tee "$HOME/.gemrc" >/dev/null
rbenv global 2.6.0-rc2
eval "$(rbenv init -)"

# goodies
sudo apt install --yes cowsay fortune

set +e
hash lolcat 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  gem install lolcat
fi

# LS_COLORS https://github.com/trapd00r/LS_COLORS
if [[ ! -f ~/.local/share/lscolors.sh ]]; then
  tmp_dir=$(mktemp -d -t LS_COLORS-XXXX)
  curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory="$tmp_dir" --strip=1
  bash -c "cd $tmp_dir && sh install.sh" >/dev/null
  rm -rf "$tmp_dir"
fi

# fzf https://github.com/junegunn/fzf
set +e
hash fzf 2>/dev/null
result_status="$?"
set -e
if [[ "$result_status" -gt 0 ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  bash ~/.fzf/install --all
fi
