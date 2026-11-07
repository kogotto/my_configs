return {
    'rmagatti/auto-session',
    config = function()
        local functions = require('core.functions')
        local group = vim.api.nvim_create_augroup(
            'BuffersCleanup',
            { clear = true, }
        )
        vim.api.nvim_create_autocmd(
            'ExitPre',
            {
                group = group,
                callback = functions.deleteAllHiddenBuffers,
                desc = 'Session will be saved on VimLeavePre. ExitPre runs just before',
            }
        )
        require('auto-session').setup({})
    end,
}
