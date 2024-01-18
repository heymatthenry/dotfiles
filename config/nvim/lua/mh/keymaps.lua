local wk = require("which-key")

wk.register({
	f = {
		name = "find",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		g = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
		b = { "<cmd>Telescope buffers<cr>", "Telescope find buffer" },
	},

	g = {
		name = "git",
		b = { "<Cmd>Gitsigns GitSigns toggle_current_line_blame<CR>", "Toggle blame on current line" },
		g = { "<Cmd>Git<CR>", "open fugitive" },
		hs = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
		hu = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Unstage hunk" },
		hp = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
		hr = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
	},

	t = {
		name = "tabs",
		p = { "<Cmd>BufferPin<CR>", "Pin/Unpin Tab" },
		["<"] = { "<Cmd>BufferMovePrevious<CR>", "Move Tab Left" },
		[">"] = { "<Cmd>BufferMovePrevious<CR>", "Move Tab Right" },
		["1"] = { "<Cmd>BufferGoto 1<CR>", "Jump to tab #1" },
		["2"] = { "<Cmd>BufferGoto 2<CR>", "Jump to tab #2" },
		["3"] = { "<Cmd>BufferGoto 3<CR>", "Jump to tab #3" },
		["4"] = { "<Cmd>BufferGoto 4<CR>", "Jump to tab #4" },
		["5"] = { "<Cmd>BufferGoto 5<CR>", "Jump to tab #5" },
		["0"] = { "<Cmd>BufferLast<CR>", "Jump to last tab" },
	},

	["<space>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
	["<tab>"] = { "<cmd>Neotree toggle<cr>", "Toggle file drawer" },
	["["] = { "<Cmd>BufferPrevious<CR>", "Previous Tab" },
	["]"] = { "<Cmd>BufferPrevious<CR>", "Next Tab" },
}, { prefix = "<leader>" })

wk.register({
	["[h"] = { "<Cmd>Gitsigns prev_hunk<CR>", "Jump to previous hunk" },
	["]h"] = { "<Cmd>Gitsigns next_hunk<CR>", "Jump to next hunk" },
})
