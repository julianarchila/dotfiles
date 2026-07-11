# Shared Zsh configuration for macOS and Linux.

# Keep user-installed command-line tools available without assuming a platform.
path_prepend() {
  [[ -d "$1" ]] || return 0
  path=("$1" $path)
}

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"

# Go tools. Mise manages the Go runtime; this preserves the conventional GOPATH.
export GOPATH="${GOPATH:-$HOME/go}"
export GOBIN="${GOBIN:-$GOPATH/bin}"
path_prepend "$GOBIN"

# Preferred editor.
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"

# Vi mode.
bindkey -v
KEYTIMEOUT=1
VI_MODE_SET_CURSOR=true

# Oh My Zsh and plugins.
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
plugins=(
  git
  docker
  kubectl
  poetry
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# Starship prompt.
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Common aliases.
alias zshconfig="${EDITOR} ~/.zshrc"
alias dotfiles="cd $HOME/dotfiles"
alias l="ls -al"
alias vi="nvim"
alias vim="nvim"
alias fucking="sudo"

if command -v batcat >/dev/null 2>&1; then
  alias bat="batcat"
elif command -v bat >/dev/null 2>&1; then
  unalias bat 2>/dev/null || true
fi

# Google Cloud SDK. Homebrew, Snap, and the official installer all work here.
if command -v gcloud >/dev/null 2>&1; then
  export USE_GKE_GCLOUD_AUTH_PLUGIN=True
  gcloud_root="$HOME/utils/google-cloud-sdk"
  if [[ -r "$gcloud_root/path.zsh.inc" ]]; then
    source "$gcloud_root/path.zsh.inc"
  fi
  if [[ -r "$gcloud_root/completion.zsh.inc" ]]; then
    source "$gcloud_root/completion.zsh.inc"
  fi
fi

# Optional developer tools.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

if command -v pnpm >/dev/null 2>&1 || [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
  path_prepend "$PNPM_HOME"
fi

if command -v bun >/dev/null 2>&1 || [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="${BUN_INSTALL:-$HOME/.bun}"
  path_prepend "$BUN_INSTALL/bin"
  if [[ -r "$BUN_INSTALL/_bun" ]]; then
    source "$BUN_INSTALL/_bun"
  fi
fi

if [[ -d "$HOME/.sst/bin" ]]; then
  path_prepend "$HOME/.sst/bin"
fi

if [[ -d "$HOME/.opencode/bin" ]]; then
  path_prepend "$HOME/.opencode/bin"
fi

if [[ -r "$HOME/.vite-plus/env" ]]; then
  source "$HOME/.vite-plus/env"
fi

# Machine-specific settings stay outside the repository.
if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
