# Path to Oh My Fish install.
set -gx OMF_PATH /Users/matt/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/matt/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
