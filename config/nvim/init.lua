require("mh.load-plugin-manager")

local o = vim.opt
local g = vim.g

o.swapfile = false

-- Set the behavior of tab
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.number = true

g.mapleader = " "

o.clipboard = "unnamedplus"

-- Tell Lazy to load everything in the `plugins` dir
require("lazy").setup("plugins")

require("mh.ui")
require("mh.keymaps")
