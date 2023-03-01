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
