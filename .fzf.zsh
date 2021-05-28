# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jocke/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jocke/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jocke/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jocke/.fzf/shell/key-bindings.zsh"

