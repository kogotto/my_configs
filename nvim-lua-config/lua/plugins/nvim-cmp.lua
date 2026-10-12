return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',

        'onsails/lspkind.nvim',
    },

    config = function()
        -- Completion menu appearance
        vim.opt.completeopt = "menu,menuone,noselect"

        local cmp = require('cmp')
        local lspkind = require('lspkind')
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
            formatting = {
                fields = { 'abbr', 'icon', 'kind', 'menu' },
                format = lspkind.cmp_format({
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50, -- actual suggestion item
                    },
                    mode = 'symbol_text',
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = false, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function (entry, vim_item)
                        -- ...
                        return vim_item
                    end
                })
            },
        })
    end,
}
