# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rahat/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/rahat/.fzf/bin"
fi

source <(fzf --zsh)
