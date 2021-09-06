#!/bin/user/env bash

install_macos_custom() {
  # Install brew if not installed
  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # All apps (This line is 2 times because there are dependencies between brew cask and brew)
  brew bundle --file="$DOTFILES_PATH/mac/brew/Brewfile" || true
  brew bundle --file="$DOTFILES_PATH/mac/brew/Brewfile"

  # Correct paths (so, we handle all with $PATH)
  sudo truncate -s 0 /etc/paths

  # Custom macOS "defaults"
  sh "$DOTFILES_PATH/mac/mac-os.sh"
}


install_common_packages() {
  sh "$DOTFILES_PATH/os/linux/packages/common_packages.sh"
}

install_linux_extra() {
  sh "$DOTFILES_PATH/os/linux/packages/chrome_setup.sh"
  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin

  #docker-clean
  curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
  sudo tee /usr/local/bin/docker-clean > /dev/null && \
  sudo chmod +x /usr/local/bin/docker-clean
}

