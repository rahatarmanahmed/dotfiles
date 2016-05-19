
# Path to your oh-my-zsh installation.
export ZSH=/Users/rahat/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="honukai"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew coffee git gulp node npm)

# User configuration

## Set PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/Rahat/bin"

## Load aliases
source $HOME/.aliases

source $ZSH/oh-my-zsh.sh

# nvm stuff
export NVM_DIR="/Users/rahat/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

