return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        animate = {
            enabled = true,
        },
        words = {
            enabled = true,
            debounce = 0,
            notify_jump = true,
        },
        notifier = {
            enabled = true,
            style = 'compact',
            level = vim.log.levels.INFO,
        },
        toggle = {
            enabled = true,
            which_key = true,
        },
        dim = {
            enabled = true,
        },
        zen = {
            enabled = true,
        },
        scroll = {
            enabled = true,
            animate = {
                duration = {
                    step = 15,
                    total = 150,
                },
            },
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                Snacks.toggle.dim():map('<leader>fd')
                Snacks.toggle.inlay_hints():map('<leader>fh')
                Snacks.toggle.zen():map('<leader>fZ')
                Snacks.toggle.zoom():map('<leader>fz')
            end,
        })
    end,
    keys = {
        -- words
        {
            ']]', function() Snacks.words.jump(vim.v.count1) end,
            desc = 'Next word', mode = { 'n', 'x', }
        },
        {
            '[[', function() Snacks.words.jump(-vim.v.count1) end,
            desc = 'Previous word', mode = { 'n', 'x', }
        },
    }
}
