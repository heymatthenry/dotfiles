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
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itspriddle/vim-marked'

"
" ftplugins
"

Plug 'jalvesaq/Nvim-R'
Plug 'chrisbra/csv.vim'

call plug#end()
