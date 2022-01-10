#!/bin/user/env bash

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_common_packages() {
  sh "$DOTFILES_PATH/os/linux/packages/common_packages.sh"
}

install_linux_extra() {
  sh "$DOTFILES_PATH/os/linux/packages/chrome_setup.sh"
  echo "Chrome installed"
  
  sh "$DOTFILES_PATH/os/linux/packages/1password_setup.sh"
  echo "1Password installed"

  sh "$DOTFILES_PATH/os/linux/packages/github_cli.sh"
  echo "Github CLI installed"  
  
  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin

  #docker-clean
  curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
  sudo tee /usr/local/bin/docker-clean > /dev/null && \
  sudo chmod +x /usr/local/bin/docker-clean

  #nodejs
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install -y nodejs yarn

  

}

