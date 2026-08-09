# ------------------------------------------------------------------------------
# Codely theme config
# ------------------------------------------------------------------------------
export EDITOR="nvim"
# export M2_HOME="$HOME/.sdkman/candidates/maven/current"
# export WINEPREFIX="$HOME/.fusion360/wineprefixes/default"
# export EDITOR="$HOME/.local/bin/lvim"
export FILE_BROWSER="nautilus"
# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
# ------------------------------------------------------------------------------
# Browser
# ------------------------------------------------------------------------------
# if [[ $(grep microsoft /proc/version) ]]; then
# 	# echo "Bash is running on WSL"
# 	export BROWSER="wsl-open"
# 	# else
# 	# echo "Bash is running on linux"
# fi

# export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.bin"
  "$HOME/.opt"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/bin/flutter/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/.local/share/JetBrains/Toolbox/scripts"
  "/snap/bin"
  "$HOME/.platformio/penv/bin"
)
