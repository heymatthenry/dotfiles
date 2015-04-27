filetype off
:set nocompatible

" initialize vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()

so ~/.vim/wildignore.vim
so ~/.vim/vimbundles.vim

" map 'jj' to ESC
imap jj <Esc>

" color
if has('gui_running')
  set guifont=Anonymice\ Powerline:h14
else
  let &t_Co=256
endif

let g:solarized_termcolors=256
colorscheme solarized
set background=dark

syntax on
filetype plugin on
filetype indent on

set noswapfile
set autoread
set autoindent
set foldmethod=indent             " code folding

set tabstop=2                     " tabs
set shiftwidth=2                  "
set expandtab                     "

set vb                            " no audible bell

set statusline=%<%f,%Y\ %h%m%r%=%-20(line=%l\/%L,\ col=%c%)%-40(buf=%n%)\ %{strftime(\"%c\")}
set number
set cursorline

let mapleader = ','               " Leader key

set hidden                        " Let me leave buffers even when they have changes

" search preferences
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" cancel search
nnoremap <leader><space> :let @/=''<cr>

" Tab to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" set wildmenu
" fancy command line completion menu
set wildmode=list:longest " complete files like a shell
set wildignore=*.DS_Store,*.dSYM,*.log,*.o,*.ss~ " files to ignore

" FuzzyFinder shortcuts
map <leader>f :FufFile<CR>
map <leader>F :FufFileWithCurrentBufferDir<CR>
map <leader>c :FufRenewCache<CR>

map <leader>T :NERDTreeToggle<CR>

" enter adds blank lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" movement
nnoremap j gj
nnoremap k gk

set tw=72
set fo=cqt
set wm=0

" Change line numbering scheme
map <leader>ln <Esc>:set number<CR>
map <leader>rn <Esc>:set relativenumber<CR>
map <leader>nn <Esc>:set nonumber norelativenumber<CR>

" Toggle statusline
map <leader>nb <Esc>:set laststatus=0<CR>
map <leader>sb <Esc>:set laststatus=2<CR>

map <leader>mp <Esc>:!open % -a Marked<CR>

" persistent undo
set undofile
set undodir=~/.vim/undo

" omnicomplete
set ofu=syntaxcomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Run jshint on save
autocmd BufWritePost,FileWritePost *.js JSHint

" tabular
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Highlight extra whitespace and call out the hated tabs
syntax match Tab /\t/
hi Tab guibg=Red guifg=NONE ctermbg=red

" Strip whitespace before write
autocmd BufWritePre * :%s/\s\+$//e

map <leader>yr <Esc>:YRShow<CR>           " Show yankring window

" remap yankring triggers
let g:yankring_replace_n_pkey = '<S-p>'
let g:yankring_replace_n_nkey = '<S-n>'

" Markdown settings
autocmd FileType markdown setlocal tw=80 wm=0 fo=cqt ts=4 sw=4 sts=0 noexpandtab

" Cheapo JSON highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" tagbar config
map <leader>b <Esc>:TagbarToggle<CR>      " Show tagbar window
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3',
    \ 'l:Heading_L4',
    \ 'm:Heading_L5',
    \ 'n:Heading_L6',
    \ 'o:Heading_L7'
  \ ]
\ }

" Goyo config

map <leader>go <Esc>:Goyo<CR>
function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
