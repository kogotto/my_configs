return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Recomendation from documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                    window_picker = {
                        enable = false
                    }
                }
            },
            filters = {
                git_ignored = false,
            },
            view = {
                width = 50,
            },

        })

        vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')
        vim.keymap.set('n', '<leader>j', '<cmd>NvimTreeFindFile!<CR>')
    end,
}
