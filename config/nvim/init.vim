"
" Required configs for Vundle
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

source .config/nvim/vimbundles.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" UI
"

syntax enable						" enable syntax highlighting
set background=light					" set solarized to light
colorscheme solarized					" turn on solarized

autocmd! bufwritepost ~/.config/nvim/init.vim source % 	" source init.vim on save

set vb                            		 	" no audible bell
let mapleader = ','

