set autoindent
filetype plugin indent on

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

" color
colorscheme vividchalk

" Always display the status line
set laststatus=2
set statusline=%<%f,%Y\ %h%m%r%=%-20(line=%l\/%L,\ col=%c%)%-40(buf=%n%)\ %{strftime(\"%c\")}

" Hide search highlighting
map <Leader>l :set invhls <CR>
