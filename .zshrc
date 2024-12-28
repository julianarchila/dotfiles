# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/julian/.oh-my-zsh"

# Export neovim path
export PATH="$PATH:/opt/nvim-linux64/bin"


#python path
export PATH=$PATH:~/.local/bin

#Android paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/rabbitmq_server-3.9.7/sbin

#Golang path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN

# VI-mode
bindkey -v

# 10ms for key sequences
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true

#ZSH_THEME="edvardm"

# Enable colors and change prompt:
autoload -U colors && colors

#PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration
plugins=(
	zsh-autosuggestions 
	history-substring-search 
	zsh-syntax-highlighting
	git
	docker
	#vi-mode
	kubectl
	poetry
)
source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
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
alias open="xdg-open"
alias savetheme="echo $RANDOM_THEME >> ~/Desktop/nice-zsh-themes.txt"
alias i3reload="i3-msg reload"
alias i3config="vi ~/.config/i3/config"
alias dotfiles="vi ~/dotfiles"
alias cat="bat"

alias testawesome="Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome"
alias fucking="sudo"
alias battery="acpi"


eval "$(starship init zsh)"

export PATH=$PATH:/home/julian/bin

# source '/home/julian/lib/azure-cli/az.completion'

export JAVA_HOME=/usr/lib/jvm/default
# export BROWSER="brave"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/julian/utils/google-cloud-sdk/path.zsh.inc' ]; then . '/home/julian/utils/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/julian/utils/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/julian/utils/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#Fuck nodejs
export NODE_OPTIONS="--dns-result-order=ipv4first"


#Flutter
export PATH=$PATH:/home/julian/Dev/tools/flutter/bin
export CHROME_EXECUTABLE="brave"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


## Cargo path
export PATH=$PATH:~/.cargo/bin



# pnpm
export PNPM_HOME="/home/julian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Turso
export PATH="/home/julian/.turso:$PATH"

# bun completions
[ -s "/home/julian/.bun/_bun" ] && source "/home/julian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
export PATH="/home/julian/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"
fpath+=~/.config/zsh/completions/_fnm

# sst
export PATH=/home/julian/.sst/bin:$PATH


#fly.io
export FLYCTL_INSTALL="/home/julian/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


#PHP Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# fnm
FNM_PATH="/home/julian/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/julian/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi


alias ssh='TERM=xterm-256color ssh'
