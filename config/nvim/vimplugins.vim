call plug#begin('~/.config/nvim/bundle')

"
" UI
"

Plug 'altercation/vim-colors-solarized' " Solarized theme
Plug 'reedes/vim-colors-pencil'         " Pencil theme
Plug 'mhinz/vim-startify'               " Fancy start screen

"
" Utilities
"

Plug 'ctrlpvim/ctrlp.vim'
Plug 'reedes/vim-pencil'
Plug 'Valloric/YouCompleteMe'

"
" ftplugins
"

Plug 'plasticboy/vim-markdown'

call plug#end()
