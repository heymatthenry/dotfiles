"
" Initialize plugins
"

source ~/.config/nvim/vimplugins.vim

"
" Filetypes
"

filetype plugin indent on

"
" UI
"

syntax enable                 " enable syntax highlighting
set background=light          " set solarized to light
colorscheme solarized         " turn on solarized

autocmd! bufwritepost ~/.config/nvim/init.vim source %  " source init.vim on save

set vb                        " no audible bell
let mapleader = ','

"
" Buffers
"

set hidden                    " suppress warning on leaving buffer

"
" Key mappings
"

noremap % v%                  " vis. select when jumping b/w matching chars
inoremap jj <ESC>             " in insert mode, map jj to Esc

"
" Special characters
"

" Whitespace

set expandtab                   " Soft tabs
set tabstop=2                   " 2 visual spaces per tab
set softtabstop=2               " 2 spaces per tab when editing
set listchars=tab:\ \ ,trail:.  " Highlight tabs chars & trailing whitespace
set list
