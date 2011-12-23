# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.zsh/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="eastwood"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/aliases   # Bring in my aliases
source ~/.zsh/functions # Load custom functions 

export EDITOR='vim'

# path stuff
export GEM_HOME='/usr/local/bin'
export GEM_PATH='/usr/local/bin'
export ANDROID_PATH='/Developer/SDKs/android-sdk-mac_x86/tools:/Developer/SDKs/android-sdk-mac_x86/platform-tools'
export MULBERRY_PATH=$HOME/Toura/mulberry/cli/bin/

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# rvm installer added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

export PATH=$HOME/local/node/bin:$ANDROID_PATH:$MULBERRY_PATH:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
