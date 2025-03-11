return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},

		config = function()
			require("neo-tree").setup({
				close_if_last_window = false,
				filesystem = {
					hijack_netrw_behavior = "disabled",
				},
				window = {
					position = "right",
					width = 30,
					mappings = {
						["ga"] = "git_add_file",
					},
				},
			})
		end,
	},
}
