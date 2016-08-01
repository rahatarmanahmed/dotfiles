# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="honukai"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

## Set PATH
export PATH="$PATH:/usr/local/git/bin:$HOME/bin:$HOME/opt/bin"

## Set EDITOR
export EDITOR=vi

## Load aliases
source $HOME/.aliases

source $ZSH/oh-my-zsh.sh

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Set vi input mode
bindkey -v
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# Add indicator for vi normal mode
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
