return {
	{ "ap/vim-css-color" },
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		config = function()
			require("tailwindcss-colors").setup()

			local nvim_lsp = require("lspconfig")

			local on_attach = function(client, bufnr)
				-- other stuff --
				require("tailwindcss-colors").buf_attach(bufnr)
			end

			nvim_lsp["tailwindcss"].setup({
				-- other settings --
				on_attach = on_attach,
			})
		end,
	},
}
