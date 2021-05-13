# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias l="exa -l"
alias la="exa -la"
alias ~="cd ~"
alias cdc="cd ~/Code"

# Git
alias gaa="git add -A"
alias gb="git branch --all"
alias gbd="git branch -d"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gcl="git clone"
alias gd="$DOTLY_PATH/bin/dot git pretty-diff"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gl="$DOTLY_PATH/bin/dot git pretty-log"
alias gs="git status -sb"
alias gsw="git switch"

# Utils
alias idea='intellij-idea-ultimate-edition'
alias mp='mousepad '
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='(thunar $PWD &>/dev/null &)'
alias up='dot package update_all'

alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'
