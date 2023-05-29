
local masonStatus, mason = pcall(require, 'mason')
if not masonStatus then
    print('Error: It seems mason is not installed')
    print(mason)
    return
end

local masonLspConfigStatus, masonLspConfig = pcall(require, 'mason-lspconfig')
if not masonLspConfigStatus then
    print('Error: It seems mason-lspconfig is not installed')
    print(masonLspConfig)
    return
end

mason.setup({
    log_level = vim.log.levels.DEBUG,
})

masonLspConfig.setup({
    ensure_installed = {
        'clangd',   -- C/C++ language server
        'cmake',
        'pylsp',
    }
})
