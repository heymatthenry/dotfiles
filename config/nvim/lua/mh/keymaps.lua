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
		bl = { "<Cmd>Gitsigns GitSigns toggle_current_line_blame<CR>", "Toggle blame on current line" },
		br = { "<Cmd>Telescope git_branches<CR>", "Show open branches on current repo" },
		g = { "<Cmd>Git<CR>", "open fugitive" },
		hs = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
		hu = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Unstage hunk" },
		hp = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
		hr = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
	},

	l = {
		name = "LSP",
		d = { "<Cmd>Telescope diagnostics<CR>", "List LSP diagnostics in buffer" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename all references to the symbol under the cursor" },
		a = {
			"<Cmd>lua vim.lsp.buf.code_action()<CR>",
			"Invoke a code action available at the current cursor position",
		},
		gl = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics in a floating window" },
		o = { "<cmd>Outline<CR>", "Toggle outline" },
	},

	n = {
		name = "Notes",
		n = { "<Cmd>ObsidianQuickSwitch<CR>", "Open Obsidian Quick Switcher" },
		t = { "<Cmd>ObsidianToday<CR>", "Open Today's Daily Note" },
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
	["]"] = { "<Cmd>BufferNext<CR>", "Next Tab" },
	["/"] = { "<Cmd>noh<CR>", "Clear search highlighting" },
}, { prefix = "<leader>" })

wk.register({
	["[h"] = { "<Cmd>Gitsigns prev_hunk<CR>", "Jump to previous hunk" },
	["]h"] = { "<Cmd>Gitsigns next_hunk<CR>", "Jump to next hunk" },

	j = { "gj", "Next visual line" },
	k = { "gk", "Previous visual line" },

	["@"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics in a floating window" },
	K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover info about symbol under cursor" },
	gd = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to the definition" },
	gD = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to declaration" },
	gi = {
		"<cmd>lua vim.lsp.buf.implementation()<cr>",
		"Lists all the implementations for the symbol under the cursor",
	},
	go = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jump to the definition of the type symbol" },
	gr = { "<cmd>lua vim.lsp.buf.references()<cr>", "Lists all the references" },
	gs = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Displays a function's signature information" },

	["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Jump to previous diagnostic" },
	["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Jump to next diagnostic" },

	["<tab><tab>"] = { "<cmd>Outline<CR>", "Toggle outline" },
})
