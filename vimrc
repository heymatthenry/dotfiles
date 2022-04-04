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

colorscheme nightfox
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
    au BufWritePost .vimrc,vimrc so $MYVIMRC
augroup END

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

lua << END
require('lualine').setup()
END

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" nvim-tree 
nnoremap <leader>t :NvimTreeToggle<CR>
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
        require("null-ls").builtins.diagnostics.tsc,        -- TS
        require("null-ls").builtins.formatting.prettier,    -- JS/TS
        require("null-ls").builtins.diagnostics.eslint,     -- "
        require("null-ls").builtins.code_actions.eslint,    -- "
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

" Trouble for project-level diagnostics
lua << EOF
  require("trouble").setup {}
EOF
