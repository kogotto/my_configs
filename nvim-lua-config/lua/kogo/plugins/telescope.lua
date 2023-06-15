local telescopeStatus, telescope = pcall(require, 'telescope')
if not telescopeStatus then
    print('Error: It seems telescope plugin is not installed')
    print(telescope)
    return
end

local actionsStatus, actions = pcall(require, 'telescope.actions')
if not actionsStatus then
    print('Error: It seems telescop.actions is not installed')
    print(actions)
    return
end

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
