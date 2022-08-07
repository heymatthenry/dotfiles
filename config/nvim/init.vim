set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/pack/bundle/start 
let &packpath = &runtimepath

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

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
colorscheme tokyonight

set termguicolors
set t_Co=256
set t_ut=

" Higlight the current line, as I have grown soft in the embrace of VSCode
set cursorline                                              " highlight current line

set number                                                  " Show current line number even with relativenumber
set relativenumber                                          " Show line numbers relative to the cursor

set laststatus=3                                            " Always show statusline

nmap <leader>l :set list!<CR>                               " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬                                 " Specify better Tab & EOL characters

nmap <silent><leader>, :set hlsearch!<CR>                   " toggle search highlighting

imap jj <Esc>                                               " double-j -> Esc

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')               " j and k should traverse soft wrapped lines, but still preserve counts
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')               " https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/

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
    au BufWritePost .config/nvim/init.vim,config/nvim/init.vim so $MYVIMRC
augroup END

tnoremap <Esc><Esc> <C-\><C-n>                              " Double ESC to jump out of nvim terminal
" tmux
"=========================================================================
autocmd VimResized * :wincmd =                              " Resize splits when window is resized

" Plugins
"=========================================================================


" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Fugitive
nmap <c-g> :Git<cr>|                              " open git status window, ala VSCode

" lualine
lua << END
require('lualine').setup {
    options = {
      disabled_filetypes = { 'NVimTree' }
    }
}
END

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" nvim-tree 
nnoremap <leader>t :NvimTreeToggle<CR>
hi NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg

lua << END
require'nvim-tree'.setup {
    hijack_netrw = false,
    view = {
        side = "right"
    }
}
END

" null-ls — formatting, linting, code actions
lua << END
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.tidy,        -- HTML
        require("null-ls").builtins.formatting.stylelint,   -- CSS
        require("null-ls").builtins.diagnostics.stylelint,  -- "
        require("null-ls").builtins.diagnostics.tsc,        -- TS
        require("null-ls").builtins.formatting.prettier,    -- JS/TS
        require("null-ls").builtins.diagnostics.eslint,     -- "
        require("null-ls").builtins.code_actions.eslint,    -- "
        require("null-ls").builtins.formatting.black,       -- Python
        require("null-ls").builtins.diagnostics.flake8,     -- "
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end
})
END

lua << EOF
    require('rust-tools').setup {}
EOF

" Trouble for project-level diagnostics
lua << EOF
  require("trouble").setup {}
EOF

" nvim terminal
lua << EOF
vim.o.hidden = true
require('nvim-terminal').setup()
EOF

" vimwiki

let g:vimwiki_list = [{ 'path': '~/Documents/Notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_rel_path = 'Daily\ Notes/'

" orgmode
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

local org_dir = '~/org'
require('orgmode').setup({
    org_agenda_files = {org_dir .. '/**/*'},
    org_default_notes_file = org_dir .. '/notes.org',
    org_capture_templates = {
        j = {
            description = 'Journal',
            template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n\n%?',
            target = org_dir .. '/journal.org'
        },
    		e = {
            description = 'Event',
            template = '* %?\n  %T',
            target = org_dir .. '/calendar.org',
        },
    }
})


require("headlines").setup()
require('org-bullets').setup()
EOF

" nvim-cmp
lua << EOF
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'orgmode' }
  },

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  },
})
EOF

" which-key
lua << EOF
  require("which-key").setup {}
  local wk = require("which-key")
  wk.register({
    ["<leader>"] = {
        [";"] = "Toggle terminal",
        ["1"] = "Open terminal #1",
        ["2"] = "which_key_ignore",
        ["3"] = "which_key_ignore",
        ["4"] = "which_key_ignore",
        ["5"] = "which_key_ignore",
        ["+"] = "which_key_ignore",
        ["-"] = "which_key_ignore",
        f = {
          name = "files and buffers",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          n = { "<cmd>enew<cr>", "New File" },
        },
        o = { name = "nvim-org" },
        w = { name = "vimwiki" }
    },
  })
EOF
