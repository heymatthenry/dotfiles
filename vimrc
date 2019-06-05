set nocompatible                          " disable vi compatibility

syntax enable				  " enable syntax
filetype plugin on

set cursorline 						" highlight current line
highlight Cursorline term=none cterm=none ctermbg=23   	" Turn on bg color, turn *off* underline

" Enable basic fuzzy search and show the results nicely
set path+=**						" Traverse subdirectories recursively
set wildmenu						" Show all matches in a menu

set relativenumber
set laststatus=2
