set nocompatible                          " disable vi compatibility 
filetype plugin on                        " enable plugins for filetypes

" Colors
syntax on                                 " Enable syntax highlighting
set background=dark                       " Background light or dark
colorscheme solarized                     " Color scheme is a solved problem

" Whitespace
set expandtab                             " spaces not tabs
set tabstop=2                             " 2 spaces
set softtabstop=2                         " delete 2 spaces when hitting backspace
set shiftwidth=2                          " indent 2 spaces at a time
set autoindent                            " start next line at the same indentation level

" netrw configuration
let g:netrw_liststyle = 3                 " Make directories expandable
let g:netrw_banner = 0                    " Suppress banner
let g:netrw_winsize = 15                  " 15 columns wide
let g:netrw_browse_split = 4              " Open files in previous window
