set autoindent                   

"filetype plugin indent on         " code folding
"set foldmethod=indent             " 

set tabstop=2                     " tabs
set shiftwidth=2                  " 
set expandtab                     " 

colorscheme vividchalk            " color

set laststatus=2                  " Always display the status line
set statusline=%<%f,%Y\ %h%m%r%=%-20(line=%l\/%L,\ col=%c%)%-40(buf=%n%)\ %{strftime(\"%c\")}

let mapleader = ','               " Leader key

set nohlsearch                    " Hide search highlighting

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

