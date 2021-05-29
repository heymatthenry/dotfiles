local lspconfig = require"lspconfig"

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client)
  end
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  settings = {
      rootMarkers = {".git/"},
      languages = {
          lua = {
              {formatCommand = "lua-format -i", formatStdin = true}
          }
      }
  }
}
