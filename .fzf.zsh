# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rahatarmanahmed/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/rahatarmanahmed/.fzf/bin"
fi

source <(fzf --zsh)
