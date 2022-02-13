#!/bin/user/env bash

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_common_packages() {
  sh "$DOTFILES_PATH/os/linux/packages/common_packages.sh"
  echo "Common packages installed"

  sh "$DOTFILES_PATH/os/linux/packages/nodejs-setup.sh"
  echo "Node JS installed"
}

install_linux_extra() {
  sh "$DOTFILES_PATH/os/linux/packages/chrome_setup.sh"
  echo "Chrome installed"
  
  sh "$DOTFILES_PATH/os/linux/packages/1password_setup.sh"
  echo "1Password installed"

  sh "$DOTFILES_PATH/os/linux/packages/github_cli.sh"
  echo "Github CLI installed"

  sh "$DOTFILES_PATH/os/linux/packages/docker_setup.sh"
  echo "Docker installed"
  
    
  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin
}

