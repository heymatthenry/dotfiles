local wk = require("which-key")

wk.register({
  f = {
    name = "find", 
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
