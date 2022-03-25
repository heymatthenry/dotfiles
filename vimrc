" Basic settings:
" These are essential to vim just working the way you'd expect vim to work
"==========================================================================

syntax enable                               " enable syntax
filetype plugin indent on                   " enable autoloading plugin based on filetype

let mapleader=" "                           " set leader key to SPC

set ttimeoutlen=100                         " Shorten time vim will wait to complete an escape sequence, per https://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line

au CursorHold,CursorHoldI,FocusGained,BufEnter * :checktime " Check timestamp on files after certain events
set autoread                                " reload files that change on disk outside the buffer https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
set hidden                                  " Allow leaving dirty buffers (including terminal buffers)

" Load plugins
"==========================================================================
runtime plugins.vim

" Text settings:
"==========================================================================

" Tabs/Spaces --- retab! reformats a file according to tab settings
set expandtab                               " Use spaces instead of tabs
set shiftwidth=2                            " In-/outdent by 4 columns
set tabstop=2                               " literal tab should be 4 columns
set softtabstop=2                           " tab key inserts 4 spaces

" UI:
"==========================================================================

" theme
set encoding=UTF-8                          " Set encoding to utf 8 (for devicons)

colorscheme night-owl
set termguicolors
set t_Co=256
set t_ut=

" Higlight the current line, as I have grown soft in the embrace of VSCode
set cursorline                                              " highlight current line

set number                                                  " Show current line number even with relativenumber
set relativenumber                                          " Show line numbers relative to the cursor

set laststatus=2                                            " Always show statusline

nmap <leader>l :set list!<CR>                               " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬                                 " Specify better Tab & EOL characters

nmap <silent><leader>, :set hlsearch!<CR>                   " toggle search highlighting

imap jj <Esc>                                               " double-j -> Esc

highlight SignColumn ctermbg=NONE guibg=NONE                " no bgcolor for signcolumn
highlight LineNr ctermbg=NONE guibg=NONE                    " …or line number
set signcolumn=yes                                          " always show signcolumn

set noshowcmd                                               " Don't show last command run
set noshowmode                                              " Don't show mode since airline shows it

set updatetime=250                                          " update sign column every .25s

set mouse=a                                                 " Yes I enabled mouse mode, sue me

" Utilities
"=========================================================================

" Enable basic fuzzy search and show the results nicely
set path+=**                                                " Traverse subdirectories recursively
set wildmenu                                                " Show all matches in a menu

" Source vimrc on save
augroup myvimrc
    au!
    au BufWritePost .vimrc,vimrc so $MYVIMRC
augroup END

" tmux
"=========================================================================
autocmd VimResized * :wincmd =                              " Resize splits when window is resized

" Plugins
"=========================================================================

" CHADtree
map <leader>t <cmd>CHADopen<CR>                           " Mapping to toggle project drawer
let g:chadtree_settings = {
    \ 'open_left': 0
    \ }

" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" fzf
set rtp+=/usr/local/opt/fzf
nmap <c-p> :Files<cr>|                                " fuzzy find files in the working directory (where you launched Vim from)
nmap <c-/> :BLines<cr>|                               " fuzzy find lines in the current file
nmap <c-r> :Rg<cr>|                                       " fuzzy find text in the working directory
nmap <leader>p :Commands<cr>|                             " fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)

" Fugitive
nmap <c-g> :Gstatus<cr>|                              " open git status window, ala VSCode

" CoC

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use Up/Down for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <Down>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <TAB> to confirm completion, `<C-g>u` means break undo chain at current
" position.
if exists('*complete_info')
  inoremap <expr> <TAB> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> gd <Plug>(coc-definition)               " jump to definition
nmap <silent> gy <Plug>(coc-type-definition)          " jump to type definition
nmap <silent> gi <Plug>(coc-implementation)           " jump to implementation
nmap <silent> gr <Plug>(coc-references)               " jump to reference
nmap <silent> rn <Plug>(coc-rename)                   " rename
tnoremap <Esc> <C-\><C-n>

nmap <silent> <Leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev-error)

nnoremap <silent> ]y :call CocAction('runCommand', 'document.jumpToNextSymbol')<CR>
nnoremap <silent> [y :call CocAction('runCommand', 'document.jumpToPrevSymbol')<CR>

" lightline
let g:lightline = {
    \ 'colorscheme': 'nightowl',
    \ 'active': { 'left': [[ 'mode', 'paste' ],
    \                      [ 'gitbranch', 'readonly', 'filename', 'modified' ]] },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ }
    \ }

let g:dashboard_default_executive ='fzf'
let g:dashboard_default_header ='skull'

" TrailerTrash
autocmd BufWritePre * TrailerTrim

" nvim-tree
let g:nvim_tree_side = 'right'
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
