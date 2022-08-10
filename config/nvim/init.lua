vim.cmd [[
    set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/pack/bundle/start
    let &packpath = &runtimepath
    runtime plugins.vim

    " Basic settings:
    " These are essential to vim just working the way you'd expect vim to work
    "==========================================================================

    syntax enable                               " enable syntax
    filetype plugin indent on                   " enable autoloading plugin based on filetype

    au CursorHold,CursorHoldI,FocusGained,BufEnter * :checktime " Check timestamp on files after certain events
]]

vim.g.mapleader = " " -- set leader key to SPC
vim.o.ttimeoutlen = 100 -- Shorten time vim will wait to complete an escape sequence, 
-- per https://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line
vim.o.autoread = true -- reload files that change on disk outside the buffer https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
vim.o.hidden = true -- Allow leaving dirty buffers (including terminal buffers)

-- Text settings:
-- ==========================================================================

-- Tabs/Spaces --- retab! reformats a file according to tab settings
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- In-/outdent by 4 columns
vim.o.tabstop = 2 -- literal tab should be 4 columns
vim.o.softtabstop = 2 -- tab key inserts 4 spaces

-- theme
vim.o.encoding = 'UTF-8' -- Set encoding to utf 8 (for devicons)

-- UI:
-- ==========================================================================

vim.g.tokyonight_style = "night"

vim.cmd [[
  colorscheme tokyonight
  set termguicolors
  set t_Co=256
  set t_ut=
]]

-- Higlight the current line, as I have grown soft in the embrace of VSCode
vim.o.cursorline = true -- highlight current line

vim.o.number = true -- Show current line number even with relativenumber
vim.o.relativenumber = true -- Show line numbers relative to the cursor
vim.o.laststatus = 3 -- Always show statusline

vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'} -- Specify better Tab & EOL characters

vim.cmd [[
  highlight SignColumn ctermbg=NONE guibg=NONE                " no bgcolor for signcolumn
  highlight LineNr ctermbg=NONE guibg=NONE                    " …or line number

  " Source vimrc on save
  augroup myvimrc
      au!
      au BufWritePost .config/nvim/init.lua,config/nvim/init.lua so $MYVIMRC
  augroup END

  " tmux
  "=========================================================================
  autocmd VimResized * :wincmd =                              " Resize splits when window is resized

  set noshowcmd                                                 " Don't show last command run
  set noshowmode                                                " Don't show mode since airline shows it
]]

vim.o.signcolumn = 'yes' -- always show signcolumn
vim.o.updatetime = 250 -- update sign column every .25s
vim.o.mouse = 'a' -- Yes I enabled mouse mode, sue me

-- Plugins
-- =========================================================================

require('user.bufferline')
require('user.cmp')
require('user.formatting-and-linting')
require('user.git')
require('user.indent-blankline')
require('user.keymaps')
require('user.lualine')
require('user.nvim-tree')
require('user.org')
require('user.project')
require('user.terminal')
require('user.treesitter')
require('user.wiki')

-- Trouble for project-level diagnostics
require("trouble").setup {}
