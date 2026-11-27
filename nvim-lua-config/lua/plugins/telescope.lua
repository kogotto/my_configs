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
                layout_config = {
                    width = 0.9,
                    height = 0.85,
                    preview_width = 0.65,
                },
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

                        ['jj'] = actions.close,
                        ['jJ'] = actions.close,
                        ['Jj'] = actions.close,
                        ['JJ'] = actions.close,
                    },
                    n = {
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })
        telescope.load_extension('fzf')

        local setKeymap = require('core.keymap').global()
        local telescopeBuiltin = require('telescope.builtin')
        setKeymap('n', '<leader>pF', telescopeBuiltin.find_files,
            'Find files in current directory')
        setKeymap('n', '<C-p>', telescopeBuiltin.git_files,
            'Find files under git control')
        setKeymap('n', '<leader>pf', telescopeBuiltin.current_buffer_fuzzy_find,
            'Fuzzy search in current buffer')
        setKeymap('n', '<leader>pg', telescopeBuiltin.grep_string,
            'grep word under cursor in current directory')
        setKeymap('n', '<leader>pG', function() telescopeBuiltin.live_grep({additional_args = { '--hidden', }}) end,
            'grep current directory as you type')
        setKeymap('n', '<leader>pr', telescopeBuiltin.lsp_references,
            'Search through references of symbol under cursor')
        setKeymap('n', '<leader>pl', telescopeBuiltin.git_commits,
            'git log -p in telescope')
        setKeymap('n', '<leader>pb', telescopeBuiltin.buffers,
            'Search through open buffers')
        setKeymap('n', '<leader>ph', telescopeBuiltin.help_tags,
            'Search through vim help files')
        setKeymap('n', '<leader>pm', function() telescopeBuiltin.man_pages({sections = {'ALL'}}) end,
            'Search through man pages')
        setKeymap('n', '<leader>pc', function() telescopeBuiltin.colorscheme({enable_preview = true}) end,
            'Show available colorschemes')
    end,
}
