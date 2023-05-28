
local cmpStatus, cmp = pcall(require, 'cmp')
if not cmpStatus then
    print('Error: It seems that nvim-cmp plugin is not installed')
    print(cmp)
    return
end

local luasnipStatus, luasnip = pcall(require, 'luasnip')
if not luasnipStatus then
    print('Error: It seems that luasnip plugin is not installed')
    print(luasnip)
    return
end

-- This will load snippets from 'frendly-snippets' collection
require("luasnip.loaders.from_vscode").lazy_load()

-- Completion menu appearance
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
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
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    }),
})
