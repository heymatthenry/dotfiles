"
" Initialize plugins
"

source ~/.config/nvim/vimplugins.vim

"
" Filetypes
"

filetype plugin indent on


" Markdown configs

autocmd BufRead,BufNewFile *.md setfiletype markdown

augroup pencil                                      " initalize pencil with md files
  autocmd!
  autocmd FileType markdown,md      call pencil#init()
  autocmd FileType text             call pencil#init()
augroup END

let g:pencil#wrapModeDefault='soft'                 " default soft wrap in Pencil
let g:pencil_terminal_italics=1
let g:vim_markdown_frontmatter=1                    " enable YAML frontmatter in md files

"
" UI
"

if has('gui_running')
  set guifont=Hack:h12
endif

syntax enable                 " enable syntax highlighting
set background=dark          " set solarized to light
colorscheme solarized         " turn on solarized

autocmd! bufwritepost ~/.config/nvim/init.vim source %  " source init.vim on save

set vb                        " no audible bell
let mapleader = ','

"
" Buffers
"

set hidden                    " suppress warning on leaving buffer

"
" Key mappings
"

noremap % v%                      " vis. select when jumping b/w matching chars
inoremap jj <ESC>                 " in insert mode, map jj to Esc
map <leader>t :NERDTreeToggle<CR> " Toggle nerdtree sidebar

"
" Special characters
"

" Whitespace

set expandtab                   " Soft tabs
set tabstop=2                   " 2 visual spaces per tab
set shiftwidth=2                " Indent by 2 spaces
set softtabstop=2               " 2 spaces per tab when editing
set listchars=tab:\ \ ,trail:.  " Highlight tabs chars & trailing whitespace
set list

"
" Plugin configs
"

" Toggle limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

