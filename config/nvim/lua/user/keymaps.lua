-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = {silent = true}

-- Basic editor behavior 

keymap('n', '<leader>l', ':set list!<CR>') -- Shortcut to rapidly toggle `set list`
keymap('i', 'jj', '<Esc>') -- double-j -> Esc

vim.cmd [[
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')               " j and k should traverse soft wrapped lines, but still preserve counts
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')               " https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  nmap <silent><leader>, :set hlsearch!<CR>                   " toggle search highlights
  tnoremap <Esc><Esc> <C-\><C-n>                              " Double ESC to jump out of nvim terminal
  
  " Better moving between splits
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
]]

-- Telescope

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- NvimTree

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- which-key config
require("which-key").setup {}
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        ["+"] = "which_key_ignore",
        ["-"] = "which_key_ignore",
        f = {
            name = "files and buffers",
            f = {"<cmd>Telescope find_files<cr>", "Find File"},
            r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
            n = {"<cmd>enew<cr>", "New File"}
        },
        o = {name = "nvim-org"},
        w = {name = "vimwiki"}
    }
})
