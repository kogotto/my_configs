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
                    time = 300,
                },
            },
        })
    end
}
