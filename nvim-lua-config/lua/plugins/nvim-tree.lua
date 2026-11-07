local function getWindowConfig()
    local screen_w = vim.o.columns
    local screen_h = vim.o.lines - vim.o.cmdheight

    local window_w = math.floor(screen_w * 0.4)
    local window_h = math.floor(screen_h * 0.8)

    local center_x = math.floor((screen_w - window_w) / 2)
    local center_y = math.floor((screen_h - window_h) / 2)

    return {
        relative = 'editor',
        border = 'double',
        width = window_w,
        height = window_h,
        row = center_y,
        col = center_x,
    }
end

local function toggleNvimTree()
    local api = require('nvim-tree.api')
    api.tree.toggle({
        find_file = true,
    })
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Recomendation from documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            hijack_cursor = true,
            actions = {
                open_file = {
                    quit_on_open = true,
                    window_picker = {
                        enable = false,
                    },
                },
                file_popup = {
                    open_win_config = {
                        border = 'double',
                    },
                },
            },
            filters = {
                git_ignored = false,
            },
            view = {
                number = true,
                relativenumber = true,
                centralize_selection = true,
                width = {
                    min = 50,
                },
                float = {
                    enable = true,
                    quit_on_focus_loss = true,
                    open_win_config = getWindowConfig,
                },
            },
            modified = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
            renderer = {
                add_trailing = true,
                group_empty = true,
                highlight_git = 'all',
                highlight_modified = 'all',
                indent_width = 4,
                indent_markers = {
                    enable = true,
                    inline_arrows = false,
                },
                icons = {
                    git_placement = 'signcolumn',
                    hidden_placement = 'after',
                    modified_placement = 'right_align',
                    show = {
                        hidden = true,
                    },
                },
                special_files = {
                    'CMakeLists.txt',
                },
            },
        })

        vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')
        vim.keymap.set('n', '<leader>j', toggleNvimTree)
    end,
}
