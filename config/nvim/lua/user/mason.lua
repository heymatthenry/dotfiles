local servers = {
  "cssls", "sumneko_lua", "rust_analyzer", "eslint", "html", "jsonls",
  "tsserver", "julials", "marksman"
}

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = servers,

  automatic_installation = true
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = {}

-- any server-specific configs can go here
local conf_opts = {
  sumneko_lua = { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
}

for _, server in pairs(servers) do
  server = vim.split(server, "@")[1]

  if conf_opts["sumneko_lua"] ~= nil then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  require('lspconfig')[server].setup { capabilities = capabilities, opts }
end
