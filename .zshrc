# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# add some color to the world
export TERM='xterm-256color'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Use async mode for autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#    colored-man-pages
#    command-not-found
    common-aliases
#    copydir
#    copyfile
#    cp
    debian
    extract
    #fzf
    gnu-utils
#    history
    history-substring-search
#    pip
#    rsync
    systemadmin
    systemd
    thefuck
#    virtualenv
    zsh-256color
#    zsh-navigation-tools
    # zsh-vim-mode # NOTE: this one causes issues when zsh-autocomplete is loaded
)

# Get oh-my-zsh going
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_ed25519"

# set some nice options
setopt appendhistory autocd nomatch autopushd pushdignoredups promptsubst histignoredups sharehistory globdots

# disable beep
unsetopt beep

# use vi-mode instead of default (emacs)
bindkey -v

# needs to be 20 for the keybinding below to work ("jj" mapped to ESC)
export KEYTIMEOUT=20

# exit vi insert mode back to normal mode using 'jj' rather than ESC (since that's what I use in nvim)
bindkey jj vi-cmd-mode

# open current line in vim
bindkey '^e' edit-command-line

# fix some stuff that is making misbehave with KEYTIMEOUT set so low
bindkey -sM vicmd '^[' '^G'
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

# Add some extra functionality for iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.oh-my-zsh/custom/plugins/zsh-autopair/zsh-autopair.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# thefuck is a must
eval $(thefuck --alias)

# Use zoxide rather than z/autojump for quick folder-jumping
eval "$(zoxide init zsh)"

alias j z

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# zsh-syntax-highlighting *must* be the last sourced script.
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# some tweaks for autocompletion (added 2020-10-27, not tested)
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' menu select

# disable completion functions to be suggested.
zstyle ':completion:*:functions' ignored-patterns '_*'

# let completion use cache, apt etc are *slow*
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.local/.zsh/cache

# disable completion to parent folder
#zstyle ':completion:*:cd:*' ignore-parents parent pwd ..

#zstyle ':completion:*:(cd|mv|cp|cat|nvim):*' ignore-parents parent pwd
# ignore parent folders for * commands, probably a bit too generic to actually work well..
zstyle ':completion:*' ignore-parents parent pwd

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
