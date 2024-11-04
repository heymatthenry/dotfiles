if status is-interactive
    set -x HOMEBREW_PATH /opt/homebrew
    set -x MYVIMRC "$HOME/Code/dotfiles/config/nvim/init.lua"
    set -x NODE_HOME "$HOME/local/node/bin"
    set -x CARGO_HOME "$HOME/.cargo/bin"
    set -x LLVM_HOME "$HOMEBREW_PATH/opt/llvm/bin"

    set fish_greeting ""
    set -x EDITOR nvim

    set -x PATH "/opt/local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
    set -gx PATH $HOME/bin $HOMEBREW_PATH/bin $CARGO_HOME/bin $NODE_HOME/bin $LLVM_HOME $PATH

    atuin init fish | source
    direnv export fish | source

    set --universal nvm_default_version lts/*

# Aliases

# git aliases
    alias gc "git commit"
    alias ga "git add"
    alias gac "git commit -am"
    alias gst "git status"
    alias push "git push"
    alias pull "git pull"
    alias gb "git branch"
    alias gco "git checkout"


# TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

# Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

# Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
end

# Created by `pipx` on 2022-10-27 00:31:26
set PATH $PATH /Users/matt/.local/bin
