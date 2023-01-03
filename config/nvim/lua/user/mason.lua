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

for _, server in pairs(servers) do
    server = vim.split(server, "@")[1]

    require('lspconfig')[server].setup {capabilities = capabilities}
end
