###################################################
# Exports
###################################################

export CLICOLOR=1

###################################################
# Antigen
###################################################

source $HOME/.antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle chriskempson/base16-shell

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
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###################################################
# Color fixes
###################################################

if [ $TMUX ]; then
    export TERM='screen-256color'
else
    export TERM='xterm-256color'
fi

# Set up the base16 color scheme
BASE16_SHELL=$HOME/.antigen/bundles/chriskempson/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

###################################################
# FZF
###################################################

# Use ag if it's installed
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'
fi

