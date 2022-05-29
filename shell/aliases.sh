# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias l="exa -l"
alias la="exa -la"
alias ~="cd ~"
alias cdc="cd ~/Code"
alias doc="cd ~/Documents"
alias dw="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dotfiles="cd $DOTFILES_PATH"
alias logout="gnome-session-quit"
alias apsr="apt-cache search"


# Git
alias gaa="git add -A"
alias gb="git branch"
alias gba="git branch --all"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gcl="git clone"
alias gca="git add --all && git commit --amend --no-edit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias gsw="git switch"

# Utils
alias vim='nvim'
alias v='nvim'
alias c='bat'
alias k='kill -9'
alias grep='grep --color=auto'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias pc.='(pycharm-community $PWD &>/dev/null &)'
alias o.='(nautilus $PWD &>/dev/null &)'
alias up='dot package update_all'

alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'
