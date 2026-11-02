local function configTreesitterObjects()
    local tsto = require('nvim-treesitter-textobjects')
    tsto.setup({
        select = {
            lookahead = true,
        },
        move = {
            set_jumps = true,
        },
    })

    local select = require('nvim-treesitter-textobjects.select')
    for key, query in pairs({
        af = '@function.outer',
        ['if'] = '@function.inner',
        ac = '@class.outer',
        ic = '@class.inner',
        aa = '@parameter.outer',
        ia = '@parameter.inner',
        as = '@statement.outer',
    }) do
        vim.keymap.set({'x', 'o'}, key, function()
            select.select_textobject(query, 'textobjects')
        end)
    end

    local move = require('nvim-treesitter-textobjects.move')
    vim.keymap.set({'n', 'x', 'o'}, ']m', function()
        move.goto_next_start('@function.outer', 'textobjects')
    end)
    vim.keymap.set({'n', 'x', 'o'}, ']M', function()
        move.goto_next_end('@function.outer', 'textobjects')
    end)
    vim.keymap.set({'n', 'x', 'o'}, '[m', function()
        move.goto_previous_start('@function.outer', 'textobjects')
    end)
    vim.keymap.set({'n', 'x', 'o'}, '[M', function()
        move.goto_previous_end('@function.outer', 'textobjects')
    end)

    local swap = require('nvim-treesitter-textobjects.swap')
    vim.keymap.set('n', '<leader>a', function()
        swap.swap_next("@parameter.inner")
    end)
    vim.keymap.set('n', '<leader>A', function()
        swap.swap_previous("@parameter.inner")
    end)
end

return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = configTreesitterObjects,
}
