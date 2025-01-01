# ~/.oh-my-zsh/custom/aliases.zsh

# reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# system
alias paths='echo -e ${PATH//:/\\n}'
alias hosts="sudo code /etc/hosts"
alias ip="curl -s https://ipinfo.io/ | jq -r '.ip,.city,.country,.org'"
alias localip="ipconfig getifaddr en0"
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias cleanup_ds="find . -type f -name '*.DS_Store' -ls -delete"
alias psg="ps aux | grep"
alias k9="kill -9"

# Homebrew
alias brf="brew search"
alias bri="brew info"
alias brl="brew list"
alias brdeps="brew deps --installed"
alias brin="brew install"
alias brrin="brew reinstall"
alias brun="brew uninstall --zap"
alias brup="brew update && brew outdated"
alias brug="brew upgrade"
alias brclr="brew autoremove && brew cleanup --prune=all && brew doctor"
alias brsl="brew services list"
alias brson="brew services start"
alias brsoff="brew services stop"

# Python
alias python="python3"
alias pip="uv pip"
alias venv="uv venv"
alias activate="source .venv/bin/activate"
alias da="deactivate"
alias jl="jupyter lab"

# yt-dlp
alias ytd="yt-dlp --embed-metadata --embed-chapters --embed-subs --sub-langs en,fa"
alias ytd-auto="ytd --write-auto-subs"
