local function setupLsp()
    vim.lsp.config(
        'pyright',
        {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = 'off',
                    }
                }
            }
        }
    )

    vim.lsp.config(
        '*',
        {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    )

    local telescope = require('telescope.builtin')

    local keymap = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            local toString = require('core.toString')
            local notify = require('core.notify')
            notify.debug('LspAttach with ev =\n%s', toString.table(ev))

            local opts = {
                noremap = true,
                silent = true,
                buffer = ev.buf,
            }
            keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
            keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opts)
            keymap.set('n', 'gi', telescope.lsp_implementations, opts)
            keymap.set('n', 'gr', telescope.lsp_references, opts)
            keymap.set('n', 'gs', '<cmd>LspClangdSwitchSourceHeader<CR>', opts)
            keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
            keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
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
        'glepnir/lspsaga.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'nvim-telescope/telescope.nvim',
    },
    config = setupLsp,
}
