return {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        'mason-org/mason.nvim',
        'neovim/nvim-lspconfig',
    },
    build = function() pcall(vim.cmd, "MasonUpdate") end,
    config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',                -- C/C++ language server
                'cmake',

                'lua_ls',                -- Lua language server

                'pyright',               -- Python type checker
                'ruff',                  -- Python linter and formatter

                'html',                  -- HTML language server
                'cssls',                 -- CSS language server
                'ts_ls',                 -- TypeScript/JavaScript language server
                'emmet_language_server', -- Emmet language server
                'jsonls',                -- JSON language server
                'yamlls',                -- YAML language server
                'eslint',                -- ESLint linter
            }
        })
    end,
}
