#!/usr/bin/sh
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias l="exa -l"
alias la="exa -la"
alias ~="cd ~"
alias cdc="cd ~/Code"
alias cdf='code $DOTFILES_PATH'
alias dotfiles='cd $DOTFILES_PATH'
alias v="bat"

# Git
alias gaa="git add -A"
alias gb="git branch --all"
alias gbd="git branch -d"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gcl="git clone"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias grh="git reset --hard"
alias gs="git status -sb"
alias gsw="git switch"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='(dolphin $PWD &>/dev/null &)'
alias up='$DOTLY_PATH/bin/dot package update_all'
alias cddf='code $DOTFILES_PATH'
alias dsave='$DOTLY_PATH/bin/dot setup commit_changes'
alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'
