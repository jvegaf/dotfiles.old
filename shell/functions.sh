#!/usr/bin/bash
function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

  _z "$1"
}

function recent_dirs() {
  # This script depends on pushd. It works better with autopush enabled in ZSH
  escaped_home=$(echo "$HOME" | sed 's/\//\\\//g')
  selected=$(dirs -p | sort -u | fzf)

  cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

function pacinst() {
  sudo pacman -S "$1" --noconfirm &&
  echo "$1" >> "$DOTFILES_PATH/os/linux/packages/pkglist.txt" 
  echo "$1 installed :white_check_mark:"
}

function yayinst() {
  yay -S "$1" --noconfirm &&
  echo "$1" >> "$DOTFILES_PATH/os/linux/packages/aurpkglist.txt"
  echo "$1 installed :white_check_mark:"
}