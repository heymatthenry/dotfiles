" A brief manifesto
" ===================
" Another day, another new text editor (except this one happens to be the one
" I've used for a decade+). But why? Isn't VSCode good enough for you? What
" about emacs/evil—you were all about that for a minute, right? Yes, me, I
" was. First, re: VSCode, it's great, and I do enjoy using it. It's incredibly
" helpful writing web code. BUT it's a lot. I don't generally care for
" electron apps (please do not @ me), I don't especially want to be surveilled
" by $MSFT while working, and generally I'm trying to cut out tools from the
" big tech companies—even the open source ones (again, please do not @ me, and
" no I haven't decided yet whether this means I ought to prefer Vue or Svelte
" over React). 
"
" As far as emacs goes, I briefly (and enthusiastically!) used emacs as my
" main editor, and actually got it working pretty nicely. I was an emacs user
" for a little bit before landing on vim, and it was fun going back. I *love*
" org-mode, and I really enjoyed having a nice literate config that could
" output to html, etc. I also love emacs-lisp. I love lisps! I don't love
" vimscript! BUT, I'm also wary of emulation, and I knew eventually I was
" going to run into something in evil that wasn't vimmy enough for my tastes,
" or maybe just a vim plugin that didn't have an evil analogue. Also I've just
" been living in vim for so long and learning the entire emacs ecosystem was
" just a lot. I've been trying to rein in my learnign ambitions and focus
" better on a smaller set of tools, and at the end of the day, that's what
" probably tipped the scales in favor of returning to vim.
"
" All that in mind, here are some goals I'm trying to keep in mind while
" rebuilding my vimrc from scratch:
"
"   1. Comment *every* line. Don't put anything in here that I don't
"   understand and can't explain in a comment.
"   2. Keep the number of plugins small but don't be a zealot about it. If I
"   don't feel like becoming a netrw master, it's ok to use NERDtree. 
"   3. Keep it organized
"
" In my last go-round with vim before wandering in the editor desert for a
" bit, I tried neovim. I may again, but for now the plan is to stick with
" Vim8. 
"
" Ok, that's a lot. Now, here is the stuff that makes vim into vim for me. 
" Much, much more TK. I'm trying to rebuild this slowly and thoughtfully,
" rather than just pasting in configs from whatever vim article floated across
" the transom at HN that day.

" Basic settings:
" These are essential to vim just working the way you'd expect vim to work
"==========================================================================

syntax enable                               " enable syntax
filetype plugin indent on                   " enable autoloading plugin based on filetype

let mapleader=" "                           " set leader key to SPC

set ttimeoutlen=100                         " Shorten time vim will wait to complete an escape sequence, per https://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line

au CursorHold,CursorHoldI,FocusGained,BufEnter * :checktime " Check timestamp on files after certain events
set autoread                                " reload files that change on disk outside the buffer 

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
set background=dark
colorscheme solarized

" Higlight the current line, as I have grown soft in the embrace of VSCode
set cursorline                                              " highlight current line

set number                                                  " Show current line number even with relativenumber
set relativenumber                                          " Show line numbers relative to the cursor

set laststatus=2                                            " Always show statusline

nmap <leader>l :set list!<CR>                               " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬                                 " Specify better Tab & EOL characters

highlight SignColumn ctermbg=NONE guibg=NONE                " no bgcolor for signcolumn
highlight LineNr ctermbg=NONE guibg=NONE                    " …or line number

set noshowcmd                                               " Don't show last command run 
set noshowmode                                              " Don't show mode since airline shows it

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

"
" Plugins
"=========================================================================

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" NERDTree
map <leader>t :NERDTreeToggle<CR>                           " Mapping to toggle project drawer
let g:NERDTreeWinPos = "right"                              " NERDTree should open on right

" Ensure webdevicons gets refreshed after NERDtree loads so clobbered settings don't get reapplied
if exists('g:loaded_webdevicons')                           
  call webdevicons#refresh()
endif

" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

let g:airline_theme='night_owl'                                 " Cribbed from https://github.com/ctaylo21/jarvis
