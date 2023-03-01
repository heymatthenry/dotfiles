autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit; promptinit

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

source ~/.zsh/aliases   # Bring in my aliases
source ~/.zsh/functions # Load custom functions

export EDITOR='nvim'
bindkey -v

# case insensitive tab complete
zstyle ':completion:*:*:git:files' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history
setopt share_history

export PATH=/opt/local/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Homebrew >= 3.0 has different paths depending on whether it's an M1 Mac
if [ $(uname -m) = "arm64" ]; then
  export HOMEBREW_PATH="/opt/homebrew"
else
  export HOMEBREW_PATH="/usr/local"
fi

export PATH=$HOME/local/node/bin:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
eval `/usr/libexec/path_helper -s`
export PATH=/Users/matt/Code/scripts:$PATH
export PATH=/Applications/Racket\ v8.8/bin:$PATH
export PATH=/Users/matthewwhenry/.cargo/bin:$PATH
export PATH=~/.ghcup/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH

fpath=(./zsh-completions $fpath)

export PATH=$PATH:$HOME/.composer/vendor/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# source ~/.zsh/secret_keys

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf should hide anything in gitignore
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"
eval "$(direnv hook zsh)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Created by `pipx` on 2022-11-02 00:17:04
export PATH="$PATH:/Users/matt/.local/bin"
