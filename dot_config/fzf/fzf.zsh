# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/eric/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/eric/.fzf/bin"
fi

source <(fzf --zsh)
