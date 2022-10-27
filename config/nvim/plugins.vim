call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rails'

Plug 'vimwiki/vimwiki'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mattn/emmet-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dunckr/js_alternate.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-conflicted'
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'
Plug 'junegunn/goyo.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'simrat39/rust-tools.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'L3MON4D3/LuaSnip'

Plug 'ahmedkhalf/project.nvim'
Plug 'folke/which-key.nvim'

" LSP stuff
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Org 
Plug 'nvim-orgmode/orgmode'
Plug 'akinsho/org-bullets.nvim'
Plug 'lukas-reineke/headlines.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'LunarVim/darkplus.nvim'
Plug 'NTBBloodbath/doom-one.nvim'

" UI enhancements
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
