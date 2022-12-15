#!/bin/user/env bash

install_common_packages() {
  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/common_packages.sh"
  echo "Common packages installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/nodejs-setup.sh"
  echo "Node JS installed"
}

install_arch_common_packages() {
  #sudo pacman -S --noconfirm --needed - < "$DOTFILES_PATH/os/linux/packages/arch/pkglist.txt"
  sh "$DOTFILES_PATH/os/linux/packages/arch/paru_setup.sh"
}

install_arch_linux_extra() {
  aurpkgs=$(cat "$DOTFILES_PATH/os/linux/packages/arch/aurpkglist.txt")
  paru -S "$aurpkgs" --noconfirm --needed
}

install_linux_extra() {
  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/chrome_setup.sh"
  echo "Chrome installed"
  
  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/1password_setup.sh"
  echo "1Password installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/github_cli.sh"
  echo "Github CLI installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/docker_setup.sh"
  echo "Docker installed"
  
    
  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin
}


install_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
}
