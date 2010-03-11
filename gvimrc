" Font
set guifont=Monaco:h13.00

" No audible bell
set vb

" No toolbar
set guioptions-=T
set guioptions-=r
set guioptions-=l

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
