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
        vim.keymap.set("n", "*", "*N") -- just highlight word under cursor
        vim.keymap.set("n", "#", "#N") -- do not jump to next
        vim.keymap.set('n', 'g*', 'g*N')
        vim.keymap.set('n', 'g#', 'g#N')
    end
}
