set nocompatible                          " disable vi compatibility
set viminfo+=n~/.vim/viminfo

" dein.vim plugins {{{
" Required:
set runtimepath+=/Users/matt/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/matt/.cache/dein')
  call dein#begin('/Users/matt/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/matt/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove plugins here:
  call dein#add('dunckr/js_alternate.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('nvie/vim-flake8')
  call dein#add('davidhalter/jedi')
  call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('ervandew/supertab')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " install deoplete and friends
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"}}}

set modelines=1                           " Check last line for file-specific
" config
let mapleader=' '
" Colors {{{
syntax on                                 " Enable syntax highlighting
" }}}

" Whitespace {{{
set expandtab                             " spaces not tabs
set tabstop=2                             " 2 spaces
set softtabstop=2                         " delete 2 spaces when hitting backspace
set shiftwidth=2                          " indent 2 spaces at a time
set autoindent                            " start next line at the same indentation level
" }}}

" netrw configuration {{{
let g:netrw_liststyle = 3                 " Make directories expandable
let g:netrw_banner = 0                    " Suppress banner
let g:netrw_winsize = 15                  " 15 columns wide
let g:netrw_browse_split = 4              " open files in previous window
let g:netrw_altv = 1

"toggle netrw like NERDtree
noremap <silent> <C-E> :Lexplore<CR>
" }}}

" Autocommands{{{
au BufWrite * :Autoformat
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" }}}

" Python-specific configs {{{
autocmd BufWritePost *.py call Flake8()   " Run flake8 on saving a python file
autocmd BufNewFile,BufRead *.py
      \ setlocal tabstop=4      |
      \ setlocal softtabstop=4  |
      \ setlocal shiftwidth=4   |
      \ setlocal textwidth=79   |
      \ setlocal fileformat=unix
" }}}

" Plugin keybindings {{{
" Mapping of js_alternate#run to <leader>t
nnoremap <leader>t :call js_alternate#run()<CR>
nnoremap <leader>f :Files<CR>
let g:python3_host_prog = '/Users/matt/.pyenv/shims/python'
let g:deoplete#enable_at_startup = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
