# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Export neovim path (Linux-specific, adjust for macOS if needed)
export PATH="$PATH:/opt/nvim-linux64/bin"

# python path
export PATH=$PATH:$HOME/.local/bin

# Android paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/rabbitmq_server-3.9.7/sbin

# Golang path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# VI-mode
bindkey -v
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true

# ZSH_THEME="edvardm"

# Enable colors and change prompt:
autoload -U colors && colors

# PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Plugins
plugins=(
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
  git
  docker
  kubectl
  poetry
)
source $ZSH/oh-my-zsh.sh

# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshconfig="vi ~/.zshrc"
alias l="ls -al"
alias vi="nvim"
alias gnome-terminal="gnome-terminal --tab"
alias savetheme="echo $RANDOM_THEME >> ~/Desktop/nice-zsh-themes.txt"
alias i3reload="i3-msg reload"
alias i3config="vi ~/.config/i3/config"
alias dotfiles="vi ~/dotfiles"
alias bat="batcat"

alias testawesome="Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome"
alias fucking="sudo"
alias battery="acpi"

eval "$(starship init zsh)"

export PATH=$PATH:$HOME/bin

# Google Cloud SDK
if [ -f "$HOME/utils/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/utils/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/utils/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/utils/google-cloud-sdk/completion.zsh.inc"
fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Node.js
export NODE_OPTIONS="--dns-result-order=ipv4first"

# Flutter
export PATH=$PATH:$HOME/Dev/tools/flutter/bin
export CHROME_EXECUTABLE="brave"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Turso
export PATH="$HOME/.turso:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# sst
export PATH=$HOME/.sst/bin:$PATH

# fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# PHP Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# SSH with colors
alias ssh='TERM=xterm-256color ssh'

# opencode
export PATH=$HOME/.opencode/bin:$PATH

#Mise
eval "$(mise activate zsh)"

