source .profile
###################################################
# Exports
###################################################

export CLICOLOR=1

###################################################
# Prompt
###################################################

setopt prompt_subst
PROMPT="%F{blue}%~%f %F{yellow}\${prompt_elapsed_time}%f"$'\n'"%(?.%F{green}.%F{red})❯%f "

# Calc elapsed time taken from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0#gistcomment-3652840
zmodload zsh/datetime

function preexec() {
  prompt_prexec_realtime=${EPOCHREALTIME}
}

function precmd() {
  if (( prompt_prexec_realtime )); then
    local -rF elapsed_realtime=$(( EPOCHREALTIME - prompt_prexec_realtime ))
    local -rF s=$(( elapsed_realtime%60 ))
    local -ri elapsed_s=${elapsed_realtime}
    local -ri m=$(( (elapsed_s/60)%60 ))
    local -ri h=$(( elapsed_s/3600 ))
    if (( h > 0 )); then
      printf -v prompt_elapsed_time '%ih%im' ${h} ${m}
    elif (( m > 0 )); then
      printf -v prompt_elapsed_time '%im%is' ${m} ${s}
    elif (( s >= 10 )); then
      printf -v prompt_elapsed_time '%.2fs' ${s} # 12.34s
    elif (( s >= 1 )); then
      printf -v prompt_elapsed_time '%.3fs' ${s} # 1.234s
    else
      printf -v prompt_elapsed_time '%ims' $(( s*1000 ))
    fi
    unset prompt_prexec_realtime
  else
    # Clear previous result when hitting ENTER with no command to execute
    unset prompt_elapsed_time
  fi
}

###################################################
# Zsh options
###################################################

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Ignore Ctrl-D that would otherwise close the shell
setopt ignoreeof

# Recognize comments
setopt interactivecomments

# CD without CD
setopt auto_cd

# Graphical completion select menu
zstyle ':completion:*' menu select

# Show completion groups
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{8}---- %d%f'

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Fuzzy completions
zstyle ':completion:*' matcher-list '' \
'm:{a-z\-}={A-Z\_}' \
'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
'r:|?=** m:{a-z\-}={A-Z\_}'

# Enable completions
autoload -U compinit
compinit

###################################################
# Key bindings
###################################################

autoload zsh/terminfo

bindkey -e # emacs command mode b/c vi mode breaks stuff

bindkey "^[[3~" delete-char # fix delete key
bindkey "^[^[[D" backward-word # [Alt-RightArrow] - move forward one word
bindkey "^[^[[C" forward-word # [Alt-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
bindkey "^[[Z" reverse-menu-complete # [Shift-Tab] - move through the completion menu backwards

## UP and DOWN to fuzzy search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # Up
bindkey "$terminfo[kcud1]" down-line-or-beginning-search # Down

# bind alt-backspace. Might need to set iterm2 to use option as +Esc
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey "^[^?" backward-kill-dir

###################################################
# Load other files
###################################################

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.extra ]] && source ~/.extra


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###################################################
# Color fixes
###################################################

if [ $TMUX ]; then
    export TERM='screen-256color'
else
    export TERM='xterm-256color'
fi

###################################################
# base16-shell
###################################################

# Set up the base16 color scheme
BASE16_SHELL=$HOME/.base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

###################################################
# FZF
###################################################

# Use ag if it's installed
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'
fi
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
fi

###################################################
# hledger
###################################################

export LEDGER_FILE=~/finances/2025.journal

# Create wrappers around common nvm consumers.
# nvm, node, yarn and npm will load nvm.sh on their first invocation,
# posing no start up time penalty for the shells that aren't going to use them at all.
# There is only single time penalty for one shell.
load-nvm() {
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

nvm() {
    unset -f nvm
    load-nvm
    nvm "$@"
}

node() {
    unset -f node
    load-nvm
    node "$@"
}

npm() {
    unset -f npm
    load-nvm
    npm "$@"
}

npx() {
    unset -f npx
    load-nvm
    npx "$@"
}

pnpm() {
    unset -f pnpm
    load-nvm
    pnpm "$@"
}

yarn() {
    unset -f yarn
    load-nvm
    yarn "$@"
}

# commenting out b/c too slow
# # Load pyenv automatically by appending
# # the following to
# # ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# # and ~/.bashrc (for interactive shells) :

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# # Restart your shell for the changes to take effect.

# # Load pyenv-virtualenv automatically by adding
# # the following to ~/.bashrc:

# eval "$(pyenv virtualenv-init -)"
