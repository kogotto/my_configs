return {
    'nvim-treesitter/nvim-treesitter',
    -- Обязательно переключаемся на ветку main
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- Теперь модуль импортируется напрямую, БЕЗ .configs
        local ts = require('nvim-treesitter')

        ts.install({
            'c',
            'cpp',
            'cmake',
            'python',
            'lua',
            'vim',
            'vimdoc',
            'query',
            'bash',
            'markdown',
        })

        -- Включение подсветки синтаксиса встроенными средствами Neovim 0.12+
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if not vim.treesitter.language.add(lang) then
                    return
                end
                vim.treesitter.start(ev.buf, lang)
                if ev.match == 'c' or ev.match == 'cpp' then
                    return
                end
                vim.bo[ev.buf].indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
            end,
        })
    end,
}
