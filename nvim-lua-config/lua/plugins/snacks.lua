return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        words = {
            enabled = true,
            debounce = 0,
        }
    },
    keys = {
        -- words
        {
            ']]', function() Snacks.words.jump(vim.v.count1) end,
            desc = 'Next word', mode = { 'n', 'x', }
        },
        {
            '[[', function() Snacks.words.jump(-vim.v.count1) end,
            desc = 'Previous word', mode = { 'n', 'x', }
        }
    }
}
