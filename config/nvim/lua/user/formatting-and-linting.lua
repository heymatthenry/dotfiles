-- null-ls — formatting, linting, code actions
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.tidy, -- HTML
        require("null-ls").builtins.formatting.stylelint, -- CSS
        require("null-ls").builtins.diagnostics.stylelint, -- "
        require("null-ls").builtins.diagnostics.tsc, -- TS
        require("null-ls").builtins.formatting.prettier, -- JS/TS
        require("null-ls").builtins.diagnostics.eslint, -- "
        require("null-ls").builtins.code_actions.eslint, -- "
        require("null-ls").builtins.formatting.black, -- Python
        require("null-ls").builtins.diagnostics.flake8, -- "
        require("null-ls").builtins.formatting.lua_format -- lua
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end
})

-- rust-tools
require('rust-tools').setup {}
