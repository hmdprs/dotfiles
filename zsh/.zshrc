# ~/.zshrc

# path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# update automatically in 30 days
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 30

# enable hyphen-insensitive completion (- and _ are the same)
HYPHEN_INSENSITIVE="true"

# disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# disable marking untracked files under VCS as dirty
# This makes repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins
# standard plugins can be found in $ZSH/plugins/
# custom plugins can be added to $ZSH_CUSTOM/plugins/
# ZSH_CUSTOM can be changed if it's needed
plugins=(
  aliases
  colored-man-pages
  common-aliases
  copyfile
  copypath
  docker
  dotenv
  extract
  fzf
  genpass
  gitfast
  history
  keychain
  npm
  ollama
  pip
  pre-commit
  qrcode
  rsync
  rust
  safe-paste
  ssh-agent
  starship
  tailscale
  ufw
  universalarchive
  uv
  z
  zsh-autosuggestions
)

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Docker completion settings
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Keychain and ssh-agent (+gpg-agent) settings
zstyle :omz:plugins:keychain agents ssh
zstyle :omz:plugins:keychain identities github-hmdprs id_rsa
zstyle :omz:plugins:keychain options --quiet

# launch omz
source $ZSH/oh-my-zsh.sh
