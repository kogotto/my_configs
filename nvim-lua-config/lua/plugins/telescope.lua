return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },

    config = function()
        local actions = require('telescope.actions')
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                winblend = 10,
                mappings = {
                    i = {
                        ['<C-p>'] = actions.cycle_history_prev,
                        ['<C-n>'] = actions.cycle_history_next,

                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,

                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                        ['<C-u>'] = actions.preview_scrolling_up,
                        ['<C-d>'] = actions.preview_scrolling_down,

                        ['<CR>'] = actions.select_default,
                        ['<C-t>'] = actions.select_tab,
                        ['<C-v>'] = actions.select_vertical,
                    },
                    n = {
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                }
            }
        })
        telescope.load_extension("fzf")

        local keymap = vim.keymap
        local telescopeBuiltin = require('telescope.builtin')
        keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, {})
        keymap.set('n', '<C-p>', telescopeBuiltin.git_files, {})
        keymap.set('n', '<leader>pg', telescopeBuiltin.grep_string, {})
        keymap.set('n', '<leader>pG', telescopeBuiltin.live_grep, {})
        keymap.set('n', '<leader>pr', telescopeBuiltin.lsp_references, {})
        keymap.set('n', '<leader>pb', telescopeBuiltin.buffers, {})
        keymap.set('n', '<leader>ph', telescopeBuiltin.help_tags, {})
        keymap.set('n', '<leader>pm', function() telescopeBuiltin.man_pages({sections = {"ALL"}}) end, {})
        keymap.set('n', '<leader>pc', function() telescopeBuiltin.colorscheme({enable_preview = true}) end, {})
    end,
}
