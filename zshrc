autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit; promptinit

source ~/.zsh/aliases   # Bring in my aliases
source ~/.zsh/functions # Load custom functions
source ~/.zsh/prompt

export EDITOR='vim'
bindkey -v

# case insensitive tab complete
zstyle ':completion:*:*:git:files' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history
setopt share_history

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH=$HOME/local/node/bin:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
eval `/usr/libexec/path_helper -s`
export PATH=/Users/matt/Code/scripts:$PATH
fpath=(./zsh-completions $fpath)

export PATH=$PATH:$HOME/.composer/vendor/bin 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# source ~/.zsh/secret_keys

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Required by chruby
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
