if status is-interactive
# Homebrew >= 3.0 has different paths depending on whether it's an M1 Mac
    if [ $(uname -m) = arm64 ]
        set -x HOMEBREW_PATH /opt/homebrew
    else
        set -x HOMEBREW_PATH /usr/local
    end

    set -x NODE_HOME "$HOME/local/node/bin"
    set -x CARGO_HOME "$HOME/.cargo/bin"
    set -x LLVM_HOME "$HOMEBREW_PATH/opt/llvm/bin"

    set fish_greeting ""
    set -x EDITOR nvim

    set -x PATH "/opt/local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
    set -gx PATH $HOME/bin $HOMEBREW_PATH/bin $CARGO_HOME/bin $NODE_HOME/bin $LLVM_HOME $PATH

# Aliases

# git aliases
    alias gc "git commit"
    alias ga "git add"
    alias gac "git commit -am"
    alias gst "git status --ignore-submodules dirty"
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

    starship init fish | source
end
