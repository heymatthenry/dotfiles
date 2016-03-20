"
" Initialize plugins
"

source ~/.config/nvim/vimplugins.vim

"
" Filetypes
"

filetype plugin indent on


" Markdown configs

let g:pencil#wrapModeDefault='soft'                 " default soft wrap in Pencil
let g:pencil_terminal_italics=1
let g:vim_markdown_frontmatter=1                    " enable YAML frontmatter in md files


augroup pencil                                      " initalize pencil with md files
  autocmd!
  autocmd FileType markdown,md,mkd  call pencil#init()
  autocmd FileType text             call pencil#init()
augroup END

"
" UI
"

syntax enable                 " enable syntax highlighting
set background=light          " set solarized to light
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

noremap % v%                  " vis. select when jumping b/w matching chars
inoremap jj <ESC>             " in insert mode, map jj to Esc

"
" Special characters
"

" Whitespace

set expandtab                   " Soft tabs
set tabstop=2                   " 2 visual spaces per tab
set softtabstop=2               " 2 spaces per tab when editing
set listchars=tab:\ \ ,trail:.  " Highlight tabs chars & trailing whitespace
set list
