# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/julian/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
export GOROOT=/usr/local/go

export PATH=$PATH:$GOBIN:$GOROOT/bin

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
export BROWSER="brave"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/julian/utils/google-cloud-sdk/path.zsh.inc' ]; then . '/home/julian/utils/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/julian/utils/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/julian/utils/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


#Fuck nodejs
export NODE_OPTIONS="--dns-result-order=ipv4first"


#Flutter
export PATH=$PATH:/home/julian/Dev/tools/flutter/bin
export CHROME_EXECUTABLE="brave"
