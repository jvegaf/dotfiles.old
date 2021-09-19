#!/bin/user/env bash



install_linux_custom() {
  sudo pacman -S --noconfirm --needed - < "$DOTFILES_PATH/os/linux/packages/pkglist.txt"
}

install_aur_packages() {
  aurpkgs=$(cat "$DOTFILES_PATH/os/linux/packages/aurpkglist.txt")
  yay -S $aurpkgs --noconfirm
}

install_linux_extra() {
  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin

  #docker-clean
  curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
  sudo tee /usr/local/bin/docker-clean > /dev/null && \
  sudo chmod +x /usr/local/bin/docker-clean
}