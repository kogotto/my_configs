return {
    'onsails/lspkind.nvim',
    dependecies = {

    },
    config = function()
        lspkind = require('lspkind')
        lspkind.init({
            mode = 'symbol',
            preset = 'default',
            menu = {
                nvim_lsp = '[LSP]',
                buffer = '[Buf]',
                path = '[Path]',
            }
        })
    end,
}
