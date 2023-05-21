-- null-ls — formatting, linting, code actions
local event = "BufWritePre" -- or "BufWritePost"

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.djhtml, -- Django HTML/Jinja/Nunjucks
    require("null-ls").builtins.diagnostics.djhtml, -- Django HTML/Jinja/Nunjucks
    require("null-ls").builtins.formatting.stylelint, -- CSS
    require("null-ls").builtins.diagnostics.stylelint, -- "
    require("null-ls").builtins.diagnostics.tsc, -- TS
    require("null-ls").builtins.diagnostics.eslint, -- "
    require("null-ls").builtins.code_actions.eslint, -- "
    require("null-ls").builtins.formatting.black, -- Python
    require("null-ls").builtins.diagnostics.flake8, -- "
    require("null-ls").builtins.formatting.lua_format -- lua

  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save"
      })
    end
  end
})

-- rust-tools
require('rust-tools').setup {}

-- prettier
local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css", "graphql", "html", "javascript", "javascriptreact", "json",
    "less", "markdown", "scss", "typescript", "typescriptreact", "yaml",
    "astro"
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true
      })
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000
  }
})
