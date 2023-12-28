require('mh.load-plugin-manager')

local o = vim.opt
local g = vim.g

-- Set the behavior of tab
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

g.mapleader = " "

-- Tell Lazy to load everything in the `plugins` dir
require('lazy').setup('plugins') 

require('mh.ui')
require('mh.keymaps')
