
local lspConfigStatus, lspConfig = pcall(require, 'lspconfig')
if not lspConfigStatus then
    print('Error: It seems that lspconfig is not installed')
    print(lspConfig)
    return
end

local cmpNvimLspStatus, cmpNvimLsp = pcall(require, 'cmp_nvim_lsp')
if not cmpNvimLspStatus then
    print('Error: It seems that cmp-nvim-lsp is not installed')
    print(cmpNvimLsp)
    return
end

local keymap = vim.keymap

-- This adds lsp related keymaps only for buffers with existing lsp server
local onAttach = function(client, buf)
    local opts = {
        noremap = true,
        silent = true,
        buffer = buf,
    }

    keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
    keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opts)
    keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
    keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
    keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
    keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
    keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
    keymap.set('n', '<leader>lo', '<cmd>Lspsaga outline<CR>', opts)
end

local capabilities = cmpNvimLsp.default_capabilities()

lspConfig.clangd.setup({
    capabilities = capabilities,
    on_attach = onAttach,
})

lspConfig.cmake.setup({
    capabilities = capabilities,
    on_attach = onAttach,
})

lspConfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = onAttach,
})
