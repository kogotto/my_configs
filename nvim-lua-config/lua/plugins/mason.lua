return {
    "williamboman/mason.nvim",
    dependencies = { 'williamboman/mason-lspconfig.nvim', },
    build = function() pcall(vim.cmd, "MasonUpdate") end,
    config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',   -- C/C++ language server
                'cmake',

                'lua_ls',   -- Lua language server

                'pyright',  -- Python type checker
                'ruff',     -- Python linter and formatter
            }
        })
    end,
}
