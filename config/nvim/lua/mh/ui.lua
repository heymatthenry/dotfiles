vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

require("lualine").setup({
	options = {
		theme = "catppuccin-mocha",
		section_separators = "",
		component_separators = "",
	},
})
