local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', {clear = true})

local function setup_autoformat(event)
  vim.api.nvim_clear_autocmds({group = fmt_group, buffer = event.buf})

  local id = vim.tbl_get(event, 'data', 'client_id')
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil then
    return
  end

  local buf_format = function(e)
    vim.lsp.buf.format({
      bufnr = e.buf,
      async = false,
      timeout_ms = 10000,
    })
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = event.buf,
    group = fmt_group,
    desc = 'Format current buffer',
    callback = buf_format,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Setup format on save',
  callback = setup_autoformat,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function(_, opts)
      -- server names and config settings available at:
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

      -- mappings of lspconfig names to mason server names:
      -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
      require'lspconfig'.html.setup{}
      require'lspconfig'.eslint.setup{}
      require'lspconfig'.pyright.setup{}
      require'lspconfig'.rust_analyzer.setup{}
      require'lspconfig'.tsserver.setup{}
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        -- python
        "flake8",
        "black",
        "pyright",
        -- web
        "eslint-lsp",
        "html-lsp",
        "json-lsp", 
        "deno",
        "css-lsp",
        "prettier",
        -- rust
        "rust-analyzer",
        -- julia
        "julia-lsp",
        --md
        "marksman"
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
  },
}
}
