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
        vim.o.winborder = 'double'
        local lspkind = require('lspkind')
        lspkind.init({})

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
                { name = 'nvim_lsp'},
                { name = 'path' },
                { name = 'buffer' },
            }),
            formatting = {
                fields = {'abbr', 'icon', 'kind', 'menu'},
                format = lspkind.cmp_format({
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...',
                    show_labelDetails = true,
                    menu = {
                        nvim_lsp = '[LSP] ',
                        buffer = '[Buf] ',
                        path = '[Path] ',
                    },
                }),
            },
        })
    end,
}
