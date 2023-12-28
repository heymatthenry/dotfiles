-- -- telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope find buffer" })

-- -- git
-- vim.keymap.set('n', '<leader>gg', '<Cmd>Git<CR>', { desc = "Open fugitive" })


local wk = require("which-key")

wk.register({
  f = {
    name = "find", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File"},
    g = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Telescope find buffer" }
  },

  g = {
    name = "git",
    g = { '<Cmd>Git<CR>', "open fugitive"}
  }
}, { prefix = "<leader>" })
