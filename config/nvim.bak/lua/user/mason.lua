local home_dir
if vim.fn.isdirectory('/Users/matthewwhenry') ~= 0 then
  home_dir = "/Users/matthewwhenry/"
else
  home_dir = "/Users/matt"
end

local node_bin = "/.nvm/versions/node/v19.8.1/bin"
vim.g.node_host_prog = home_dir .. node_bin .. "/node"

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server
-- (handled by :Mason currently)
vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

local servers = {
  "cssls", "lua_ls", "rust_analyzer", "eslint", "html", "jsonls", "tsserver",
  "julials", "marksman"
}

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = servers,

  automatic_installation = true
}

-- Set up lspconfig.
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } }, telemetry = { enable = false } }
  }
}
