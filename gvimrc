" Font
set guifont=Monaco:h13.00

" No audible bell
set vb

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

" PeepOpen
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
end
