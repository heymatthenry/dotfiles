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
export HOMEBREW_PATH="/opt/homebrew/bin"

export PATH=$HOME/local/node/bin:$HOMEBREW_PATH
export PATH=$HOME/local/node/bin:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
eval `/usr/libexec/path_helper -s`
export PATH=/Users/matt/Code/scripts:$PATH
export PATH=/Applications/Racket\ v8.8/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.ghcup/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH

fpath=(./zsh-completions $fpath)

export PATH=$PATH:$HOME/.composer/vendor/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# source ~/.zsh/secret_keys

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

