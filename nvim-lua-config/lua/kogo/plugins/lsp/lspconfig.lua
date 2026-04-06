
local telescopeBuiltinStatus, telescopeBuiltin = pcall(require, 'telescope.builtin')

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = {
            noremap = true,
            silent = true,
            buffer = ev.buf,
        }
        keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opts)
        keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        if telescopeBuiltinStatus then
            keymap.set('n', 'gr', telescopeBuiltin.lsp_references, opts)
        else
            keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        end
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
