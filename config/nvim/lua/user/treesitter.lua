-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {'phpdoc', 'haskell'},
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'} -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
    },
    disable = {'phpdoc', 'haskell'},
    autopairs = {enable = true},
    indent = {enable = true}
}
