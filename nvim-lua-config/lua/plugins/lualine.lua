return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_show_tabline = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        icon = '', -- Your favorite icon here
                    },
                },
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                    'lsp_status',
                },
                lualine_x = {'searchcount', 'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        mode = 2, -- show nr and filename
                        path = 1, -- show relative path
                        max_length = vim.o.columns,
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'filesize'}
            }
        })
    end,
}
