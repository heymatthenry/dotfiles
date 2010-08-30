set autoindent
filetype plugin indent on

set foldmethod=indent

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

" color
colorscheme vividchalk

" Always display the status line
set laststatus=2
set statusline=%<%f,%Y\ %h%m%r%=%-20(line=%l\/%L,\ col=%c%)%-40(buf=%n%)\ %{strftime(\"%c\")}

let mapleader = ',' " Leader key


" Hide search highlighting
set invhls

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

