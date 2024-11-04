return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function(_, opts)
			-- server names and config settings available at:
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

			-- mappings of lspconfig names to mason server names:
			-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.astro.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.html.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.eslint.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = lsp_capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- tell lua-language-server about global vim
						},
					},
				},
			})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			use_diagnostic_signs = true,
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		{
			"hedyhli/outline.nvim",
			lazy = true,
			cmd = { "Outline", "OutlineOpen" },
			opts = {
				-- Your setup opts here
			},
		},
	},
}
