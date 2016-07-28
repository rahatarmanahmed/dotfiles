# Path to your oh-my-zsh installation.
export ZSH=/Users/rahat/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="honukai"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

## Set PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/bin:$HOME/opt/bin"

## Set EDITOR
export EDITOR=vi


## Load aliases
source $HOME/.aliases

source $ZSH/oh-my-zsh.sh

# nvm stuff
export NVM_DIR="/Users/rahat/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Set vi input mode
bindkey -v
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search
