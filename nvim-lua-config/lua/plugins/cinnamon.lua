return {
    'declancm/cinnamon.nvim',
    config = function()
        require('cinnamon').setup({
            keymaps = {
                basic = true,
                extra = true,
            },
            options = {
                mode = 'window',
                max_delta = {
                    time = 150,
                },
            },
        })
        -- set mappings after cinnamon setup because they not move cursor anywhere
        local functions = require('core.functions')
        vim.keymap.set('n', '*', functions.justHightlightStrictForward,
            { silent = true, desc = 'Highlight word without jumping and search forward' }
        )
        vim.keymap.set('n', '#', functions.justHightlightStrictBackward,
            { silent = true, desc = 'Highlight word without jumping and search backward' }
        )
        vim.keymap.set('n', 'g*', functions.justHightlightWeakForward,
            { silent = true, desc = 'Highlight word without jumping and search forward' }
        )
        vim.keymap.set('n', 'g#', functions.justHightlightWeakBackward,
            { silent = true, desc = 'Highlight word without jumping and search backward' }
        )
    end
}
