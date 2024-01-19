return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			style = "moon",
		},
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				headlines = true,
				indent_blankline = {
					enabled = true,
				},
				lsp_trouble = true,
				mason = true,
				markdown = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
}
