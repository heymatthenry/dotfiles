set guifont=Monaco:h13.00         " font

" No toolbar
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" Fullscreen should be *fullscreen*
set fuoptions=maxvert,maxhorz

set laststatus=2                  " Always display the status line

"set list listchars=tab:>>,trail:·,eol:¶
map <leader>hc <Esc>:set nolist<CR>
map <leader>sc <Esc>:set list listchars=tab:>>,trail:·,eol:¶<CR>
