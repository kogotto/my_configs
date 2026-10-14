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
                'lua_ls',
                'pyright',
                'ruff',
            }
        })
    end,
}
