autoload -U colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit

zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}[%b]%{$reset_color%}%{$fg[red]%}%m%u%c%{$reset_color%}"

precmd() {
  vcs_info
}


source ~/.zsh/aliases   # Bring in my aliases
source ~/.zsh/functions # Load custom functions
source ~/.zsh/prompt    # Load prompt

export EDITOR='vim'

bindkey -v

# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history
setopt share_history

# path stuff
export GEM_HOME='/usr/local/bin'
export GEM_PATH='/usr/local/bin'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH=$HOME/local/node/bin:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
eval `/usr/libexec/path_helper -s`
export PATH=/Users/matt/Code/scripts:$PATH
fpath=(./zsh-completions $fpath)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.zsh/secret_keys
