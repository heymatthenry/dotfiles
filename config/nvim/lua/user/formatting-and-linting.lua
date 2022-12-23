-- null-ls — formatting, linting, code actions
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.djhtml, -- Django HTML/Jinja/Nunjucks
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
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd(
                "nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd(
                "xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
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
