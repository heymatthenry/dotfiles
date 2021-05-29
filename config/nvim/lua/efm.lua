local lspconfig = require 'lspconfig'

local prettier = require "efm/prettier"
local eslint = require "efm/eslint"

local languages = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern("package.json", "yarn.lock", "lerna.json", ".git"),
  filetypes = vim.tbl_keys(languages),
  init_options = {documentFormatting = true, codeAction = true},
  settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
  on_attach = on_attach
}
