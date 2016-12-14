###################################################
# Exports
###################################################

export CLICOLOR=1

###################################################
# Antigen
###################################################

source $HOME/.antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

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

###################################################
# Key bindings
###################################################

autoload zsh/terminfo
bindkey "^[[3~" delete-char # fix delete key
bindkey "^[^[[D" backward-word # [Alt-RightArrow] - move forward one word
bindkey "^[^[[C" forward-word # [Alt-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
bindkey "${terminfo[kcbt]}" reverse-menu-complete # [Shift-Tab] - move through the completion menu backwards

# bind alt-backspace. Might need to set iterm2 to use option as +Esc
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey "^[^?" backward-kill-dir

###################################################
# nvm
###################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

###################################################
# Load other files
###################################################

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.extra ]] && source ~/.extra
