-- Bootstrap packer installation
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- tpope cinematic universe
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-endwise'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-rails'

    use 'vimwiki/vimwiki'
    use 'nvim-lualine/lualine.nvim'
    use 'mattn/emmet-vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'lewis6991/gitsigns.nvim'
    use 'dunckr/js_alternate.vim'
    use 'Glench/Vim-Jinja2-Syntax'
    use {'junegunn/fzf', run = ":call fzf#install()"}
    use 'junegunn/fzf.vim'
    use 'christoomey/vim-conflicted'
    use 'sheerun/vim-polyglot'
    use 'vim-ruby/vim-ruby'
    use 'kyazdani42/nvim-tree.lua'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'folke/trouble.nvim'
    use 'mfussenegger/nvim-dap'
    use 'simrat39/rust-tools.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'L3MON4D3/LuaSnip'

    use 'ahmedkhalf/project.nvim'
    use 'folke/which-key.nvim'

    -- LSP stuff
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use {
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',
    }

    -- Themes
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'LunarVim/darkplus.nvim'
    use 'NTBBloodbath/doom-one.nvim'

    -- UI enhancements
    use 'RRethy/vim-illuminate'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'folke/zen-mode.nvim'
    use 'folke/twilight.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then require('packer').sync() end
end)
