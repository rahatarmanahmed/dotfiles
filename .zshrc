
# Path to your oh-my-zsh installation.
export ZSH=/Users/rahat/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="honukai"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

## Set PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/bin:$HOME/opt/bin"

## Load aliases
source $HOME/.aliases

source $ZSH/oh-my-zsh.sh

# Set vi input mode
set -o vi

# nvm stuff
export NVM_DIR="/Users/rahat/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

