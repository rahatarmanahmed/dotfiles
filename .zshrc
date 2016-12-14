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

## Ignore Ctrl-D that would otherwise close the shell
setopt ignoreeof

###################################################
# Key bindings
###################################################

## Set vi input mode
bindkey -v

## bind UP and DOWN arrow keys in vi mode
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

## bind other keys
bindkey "^[[3~" delete-char # fix delete key
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

## bind alt-backspace. Might need to set iterm2 to use option as +Esc
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey "^[^?" backward-kill-dir

## Add indicator for vi normal mode
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1



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
