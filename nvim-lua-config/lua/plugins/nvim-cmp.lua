return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
    },

    config = function()
        -- Completion menu appearance
        vim.opt.completeopt = "menu,menuone,noselect"

        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- scroll preview up
                ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- scroll preview down
                ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'buffer' },
                { name = 'nvim_lsp'},
            }),
        })
    end,
}
