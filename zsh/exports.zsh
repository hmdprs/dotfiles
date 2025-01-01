# ~/.oh-my-zsh/custom/exports.zsh

# language and locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTORY_IGNORE='(ls|ll|la|cd|pwd|exit)*'
setopt EXTENDED_HISTORY                 # write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY               # write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY                    # share history between all sessions
setopt HIST_IGNORE_DUPS                 # do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS             # delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_SPACE                # do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS                # do not write a duplicate event to the history file
setopt HIST_VERIFY                      # do not execute immediately upon history expansion
setopt APPEND_HISTORY                   # append to history file (Default)
setopt HIST_NO_STORE                    # don't store history commands
setopt HIST_REDUCE_BLANKS               # remove superfluous blanks from each command line being added to the history

# Python
export PYTHONIOENCODING='UTF-8'         # use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONDONTWRITEBYTECODE=1        # prevent writing .pyc files
export PYTHONUNBUFFERED=1               # prevent buffering stdout and stderr

# fzf: respect .gitignore, include hidden files, and exclude .git
export FZF_DEFAULT_OPTS='--layout=reverse'
export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
