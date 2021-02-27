call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'

Plug 'hardcoreplayers/dashboard-nvim'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'dunckr/js_alternate.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-conflicted'
Plug 'sheerun/vim-polyglot'
Plug 'csexton/trailertrash.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vimpostor/vim-tpipeline'
call plug#end()
