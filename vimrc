" Basic settings:
" These are essential to vim just vorking the way you'd expect vim to work
"==========================================================================

set nocompatible                          " disable vi compatibility
syntax enable				  " enable syntax
filetype plugin on

" UI:
"==========================================================================

" Higlight the current line, as I have grown soft in the embrace of VSCode
"
set cursorline 						" highlight current line
highlight Cursorline term=none cterm=none ctermbg=23   	" Turn on bg color, turn *off* underline

set relativenumber					" Show line numbers relative to the cursor

set laststatus=2					" Always show statusline

" Enable basic fuzzy search and show the results nicely
set path+=**						" Traverse subdirectories recursively
set wildmenu						" Show all matches in a menu
