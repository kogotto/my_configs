return {
    'lewis6991/gitsigns.nvim',
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            numhl = true,
            current_line_blame_opts = {
                virt_text_pos = 'right_align',
                delay = 0,
            },
            on_attach = function(bufnr)
                local function map(mode, l, r, desc)
                    local opts = {}
                    opts.buffer = bufnr
                    opts.desc = desc
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function() gitsigns.nav_hunk('next') end, 'Next hunk')
                map('n', '[c', function() gitsigns.nav_hunk('prev') end, 'Prev hunk')
                -- Show diff
                map('n', '<leader>gd', gitsigns.diffthis, 'Diff this file')
                -- Text objects
                map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'Git hunk')
                -- Blame
                map('n', '<leader>gbl',
                    gitsigns.toggle_current_line_blame,
                    'Toggle current line blame')
                map('n', '<leader>gbf',
                    gitsigns.blame,
                    'Show full blame')
            end,
        })
    end,
}
