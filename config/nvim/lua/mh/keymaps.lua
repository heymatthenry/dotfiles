local wk = require("which-key")

wk.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope find buffer" },

	{ "<leader>g", group = "git" },
	{ "<leader>gbl", "<Cmd>Gitsigns GitSigns toggle_current_line_blame<CR>", desc = "Toggle blame on current line" },
	{ "<leader>gbr", "<Cmd>Telescope git_branches<CR>", desc = "Show open branches on current repo" },
	{ "<leader>gg", "<Cmd>Git<CR>", desc = "open fugitive" },
	{ "<leader>ghs", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
	{ "<leader>ghu", "<Cmd>Gitsigns undo_stage_hunk<CR>", desc = "Unstage hunk" },
	{ "<leader>ghp", "<Cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
	{ "<leader>ghr", "<Cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },

	{ "<leader>l", group = "LSP" },
	{ "<leader>ld", "<Cmd>Telescope diagnostics<CR>", desc = "List LSP diagnostics in buffer" },
	{
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		desc = "Rename all references to the symbol under the cursor",
	},
	{
		"<leader>la",
		"<Cmd>lua vim.lsp.buf.code_action()<CR>",
		desc = "Invoke a code action available at the current cursor position",
	},
	{ "<leader>lgl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostics in a floating window" },
	{ "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle outline" },

	{ "<leader>n", group = "Notes" },
	{ "<leader>nn", "<Cmd>ObsidianQuickSwitch<CR>", desc = "Open Obsidian Quick Switcher" },
	{ "<leader>nt", "<Cmd>ObsidianToday<CR>", desc = "Open Today's Daily Note" },

	{ "<leader>t", group = "Tabs" },
	{ "<leader>tp", "<Cmd>BufferPin<CR>", desc = "Pin/Unpin Tab" },
	{ "<leader>t<", "<Cmd>BufferMovePrevious<CR>", desc = "Move Tab Left" },
	{ "<leader>t>", "<Cmd>BufferMovePrevious<CR>", desc = "Move Tab Right" },
	{ "<leader>t1", "<Cmd>BufferGoto 1<CR>", desc = "Jump to tab #1" },
	{ "<leader>t2", "<Cmd>BufferGoto 2<CR>", desc = "Jump to tab #2" },
	{ "<leader>t3", "<Cmd>BufferGoto 3<CR>", desc = "Jump to tab #3" },
	{ "<leader>t4", "<Cmd>BufferGoto 4<CR>", desc = "Jump to tab #4" },
	{ "<leader>t5", "<Cmd>BufferGoto 5<CR>", desc = "Jump to tab #5" },
	{ "<leader>t0", "<Cmd>BufferLast<CR>", desc = "Jump to last tab" },

	{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader><tab>", "<cmd>Neotree toggle<cr>", desc = "Toggle file drawer" },
	{ "<leader>[", "<Cmd>BufferPrevious<CR>", desc = "Previous Tab" },
	{ "<leader>]", "<Cmd>BufferNext<CR>", desc = "Next Tab" },
	{ "<leader>/", "<Cmd>noh<CR>", desc = "Clear search highlighting" },
})

wk.add({
	{ "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Jump to previous hunk" },
	{ "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Jump to next hunk" },

	{ "j", "gj", desc = "Next visual line" },
	{ "k", "gk", desc = "Previous visual line" },

	{ "@", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostics in a floating window" },
	{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show hover info about symbol under cursor" },
	{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to the definition" },
	{ "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Jump to declaration" },
	{
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<cr>",
		desc = "Lists all the implementations for the symbol under the cursor",
	},
	{ "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Jump to the definition of the type symbol" },
	{ "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Lists all the references" },
	{ "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Displays a function's signature information" },

	{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Jump to previous diagnostic" },
	{ "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Jump to next diagnostic" },

	{ "<tab><tab>", "<cmd>Outline<CR>", desc = "Toggle outline" },
})
