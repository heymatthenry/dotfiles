# Set Zsh theme
autoload -U promptinit
promptinit
prompt ResetAll

# General preferences
setopt autocd  # cd when a path is entered
setopt nobeep  # never beep

# History 
HISTSIZE=1000
SAVEHIST=1000
HISTORY=~/.zsh/history
setopt sharehistory
setopt INC_APPEND_HISTORY

# Use Vim keybindings
bindkey -v
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Set global variables 
export EDITOR='vim'
export LSCOLORS="cxfxcxdxbxegedabagacad"
export GEM_HOME='/usr/local/Cellar/RubyGems/1.8/'
export PATH=$PATH:/usr/local/Cellar/RubyGems/1.8/bin/:/usr/local/narwhal/bin/

# BRING in all of my aliases
source ~/.zsh/aliases
source ~/.zsh/titlebar
source ~/.zsh/git
source ~/.zsh/git_prompt
# rvm installer added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

