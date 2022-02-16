# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias l="exa -l"
alias la="exa -la"
alias ~="cd ~"
alias cdc="cd ~/Code"
alias cddf="code $DOTFILES_PATH"
alias dotfiles="cd $DOTFILES_PATH"
alias logout="gnome-session-quit"


# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gca="git add --all && git commit --amend --no-edit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias gsw="git switch"
alias gcl="git clone"

# Utils
alias idea='intellij-idea-community'
alias more='moar'
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='(nemo $PWD &>/dev/null &)'
alias up='dot package update_all'
alias qtdesigner='(qt6-tools designer $PWD &>/dev/null &)'

alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'
