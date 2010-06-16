let highlight=0

source ~/.vim/writeroom/writeroomrc
view ~/.vim/writeroom/empty_lines

vsplit
vsplit
wincmd l
split
split
wincmd j

set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=m
set noruler

argu 1

com! -nargs=1 WriteRoomFG call Foreground(<f-args>)
com! -nargs=1 WriteRoomBG call Background(<f-args>)
com! -nargs=1 WriteRoomNonText call NonText(<f-args>)
com! -nargs=1 WriteRoomFilename call Filename(<f-args>)

if !exists("*ToggleHL")
	function ToggleHL()
		if g:highlight == "1"
			set nolist
			exec "hi NonText guifg=" g:background "guibg=NONE ctermfg=0 ctermbg=0"
			let g:highlight=0
		else
			set list
			exec "hi NonText guifg=" g:nontext "ctermfg=3"
			let g:highlight=1
		endif
	endfunction
endif

if !exists("*UpdateScreen")
	function UpdateScreen()
		exec "set wiw=" . g:width "wh=" . g:height
		exec "hi Normal guibg=" g:background "guifg=" g:foreground
		exec "hi VertSplit guibg=" g:background "guifg=" g:background
		exec "hi StatusLine guibg=" g:background "guifg=" g:filename
		exec "hi StatusLineNC guibg=" g:background "guifg=" g:background
		exec "hi NonText guifg=" g:background "guibg=" g:background
		if g:highlight == "0"
			exec "hi NonText guifg=" g:background "guibg=NONE ctermfg=0 ctermbg=0"
		else
			exec "hi NonText guifg=" g:nontext "ctermfg=3"
		endif
	endfunction
endif

if !exists("*Foreground")
	function Foreground(color)
		let g:foreground=a:color
		call UpdateScreen()
	endfunction
endif

if !exists("*Background")
	function Background(color)
		let g:background=a:color
		call UpdateScreen()
	endfunction
endif

if !exists("*Special")
	function NonText(color)
		let g:nontext=a:color
		call UpdateScreen()
	endfunction
endif

if !exists("*Filename")
	function Filename(color)
		let g:filename=a:color
		call UpdateScreen()
	endfunction
endif

map <F5> :call ToggleHL()<CR>
imap <F5> <Esc>:call ToggleHL()<CR>i
cmap q qa

call UpdateScreen()

wincmd =
autocmd VimResized * wincmd =
autocmd ColorScheme * call UpdateScreen()
