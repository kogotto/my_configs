local function setupLsp()
    vim.lsp.enable('clangd')
    vim.lsp.enable('cmake')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('pyright')
    vim.lsp.enable('ruff')

    vim.lsp.config.pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = 'off',
                }
            }
        }
    }


    vim.lsp.config("*", {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    local keymap = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UsetLspConfig", {}),
        callback = function(ev)
            local opts = {
                noremap = true,
                silent = true,
                buffer = ev.buf,
            }
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
    })
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'glepnir/lspsaga.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = setupLsp,
}
