" Basic settings:
" These are essential to vim just vorking the way you'd expect vim to work
"==========================================================================

set nocompatible                            " disable vi compatibility
syntax enable                               " enable syntax
filetype plugin on                          " enable autoloading plugin based on filetype

let mapleader=" "                           " set leader key to SPC

" Text settings:
"==========================================================================

" Tabs/Spaces --- retab! reformats a file according to tab settings
set expandtab                               " Use spaces instead of tabs
set shiftwidth=4                            " In-/outdent by 4 columns
set tabstop=4                               " literal tab should be 4 columns
set softtabstop=4                           " tab key inserts 4 spaces

" UI:
"==========================================================================

" Higlight the current line, as I have grown soft in the embrace of VSCode
set cursorline                                              " highlight current line
highlight Cursorline term=none cterm=none ctermbg=23        " Turn on bg color, turn *off* underline

set relativenumber                                          " Show line numbers relative to the cursor

set laststatus=2                                            " Always show statusline

nmap <leader>l :set list!<CR>                               " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬                                 " Specify better Tab & EOL characters

" Enable basic fuzzy search and show the results nicely
set path+=**                                                " Traverse subdirectories recursively
set wildmenu                                                " Show all matches in a menu

