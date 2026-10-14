return {
    'nvim-treesitter/nvim-treesitter',
    -- Обязательно переключаемся на ветку main
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Теперь модуль импортируется напрямую, БЕЗ .configs
        local ts = require("nvim-treesitter")

        -- Установка парсеров теперь вызывается вручную через install()
        ts.install({
            "c",
            "cpp",
            "python",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
        })

        -- Включение подсветки синтаксиса встроенными средствами Neovim 0.12+
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                -- Проверяем, доступен ли парсер для текущего типа файла
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if lang then
                    pcall(vim.treesitter.start, buf, lang)
                end
            end,
        })
    end,
}
