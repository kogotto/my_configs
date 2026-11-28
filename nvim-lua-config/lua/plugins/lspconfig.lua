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

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('KogoLspConfig', { clear = true, }),
        callback = function(ev)
            local toString = require('core.toString')
            local notify = require('core.notify')
            notify.debug('LspAttach with ev =\n%s', toString.table(ev))

            local setKeymap = require('core.keymap').buffer(ev.buf)

            setKeymap('n', 'gd', vim.lsp.buf.declaration,
                'Go to declaration')
            setKeymap('n', 'gD', '<cmd>Lspsaga peek_definition<CR>',
                'Show definition in floating window')
            setKeymap('n', 'gi', telescope.lsp_implementations,
                'Show implementations of interface')
            setKeymap('n', 'gr', telescope.lsp_references,
                'Show lsp references')
            setKeymap('n', 'gs', '<cmd>LspClangdSwitchSourceHeader<CR>',
                'Switch source/header')
            setKeymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>',
                'Show available code actions')
            setKeymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>',
                'Rename symbol across whole project')
            setKeymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>',
                'Show previous diagnostic')
            setKeymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>',
                'Show next diagnostic')
            setKeymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>',
                'Show hover doc')
            setKeymap('n', '<leader>lo', '<cmd>Lspsaga outline<CR>',
                'Show outline of document in vertical split')
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
