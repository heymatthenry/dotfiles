"necessary on some Linux distros for pathogen to properly load bundles
filetype off

call pathogen#runtime_append_all_bundles()  " load pathogen bundles

set autoindent                   

"filetype plugin indent on         " code folding
"set foldmethod=indent             " 

set tabstop=2                     " tabs
set shiftwidth=2                  " 
set expandtab                     " 

colorscheme vividchalk            " color

set laststatus=2                  " Always display the status line
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
map <leader>t :NERDTreeToggle<CR>
map <leader>f :FufFile<CR>
map <leader>F :FufFileWithCurrentBufferDir<CR>
map <leader>b :FufBuffer<CR>
map <leader>/ :FufFileRecursive<CR>
map <leader>r :FufRenewCache<CR>

" enter adds blank lines
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Change line numbering scheme
map <leader>ln <Esc>:set number<CR>
map <leader>rn <Esc>:set relativenumber<CR>
map <leader>nn <Esc>:set nonumber norelativenumber<CR>

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
