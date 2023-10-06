# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/google/home/rahatahmed/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/google/home/rahatahmed/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/google/home/rahatahmed/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/google/home/rahatahmed/.fzf/shell/key-bindings.zsh"
