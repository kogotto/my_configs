local mode_icons = {
    n = '󰋜', -- normal
    i = '󰏫', -- insert
    v = '󰈈', -- visual
    V = '󰈈', -- visual line
    ['\22'] = '󰈈', -- visual block (Ctrl-V)
    c = '', -- command
    R = '󰛔', -- replace
    s = '󰒉', -- select
    t = '', -- terminal
}

local function addIconToMode(str)
    local icon = mode_icons[vim.fn.mode()] or ''
    return icon .. ' ' .. str
end

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
                        fmt = addIconToMode,
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
                        max_length = function() return vim.o.columns end
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
