# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="lsd -l"
alias ll="lsd -la"
alias ~="cd ~"
alias cdc="cd ~/Code"
alias cdcl="cd ~/Code/tl/tulotero"
alias doc="cd ~/Documents"
alias dw="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dotfiles="cd $DOTFILES_PATH"
alias logout="gnome-session-quit"
alias avcfg="nvim ~/.config/nvim/lua/user/init.lua"
alias chadcfg="nvim ~/.config/nvim/lua/custom/init.lua"
alias nvcfg="nvim ~/.config/nvim/init.lua"
alias lvcfg="lvim ~/.config/lvim/config.lua"
alias r="ranger"
alias paru="paru --bottomup"
alias edalias="nvim $DOTFILES_PATH/shell/aliases.sh"
alias dfscripts="cd $DOTFILES_PATH/os/linux/packages/xBuntu"
alias run="./run"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias open='xdg-open'

# Security
alias checkrootkits="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --check"
alias checkvirus="clamscan --recursive=yes --infected /home"
alias updateantivirus="sudo freshclam"

# Git
alias g="lazygit"
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
alias rmd='rm -rf'
alias sb="/snap/bin/subl"
alias v='nvim'
alias b='bat'
alias k='kill -9'
alias grep='grep --color=auto'
# alias idea='intellij-idea-ultimate-edition'
# alias idea='intellij-idea-ultimate'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias v.='(nvim $PWD &>/dev/null &)'
alias l.='(lapce $PWD &>/dev/null &)'
alias o.='(thunar $PWD &>/dev/null &)'
alias up='dot package update_all'

alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'

alias winreb='sudo grub-reboot 2 && sudo reboot'

# WSL
alias expl='/mnt/c/Windows/explorer.exe'
alias winyank='/mnt/c/Users/josev/scoop/shims/win32yank.exe'

#VPN
alias vpnup='sudo systemctl start wg-quick@TL_vpn'
alias vpndown='sudo systemctl stop wg-quick@TL_vpn'
alias vpnstatus='sudo systemctl status wg-quick@TL_vpn'
# status vpn tunnel sudo wg
