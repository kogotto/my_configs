-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
        {
            'Mofiqul/dracula.nvim',
            lazy = false,
            priority = 1000,
            config = function() require('core.colorscheme') end,
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function() require("kogo.plugins.nvim-tree") end,
        },
        {
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
                         "c", "cpp", "python", "lua", "vim", "vimdoc", "query", "markdown",
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
        },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
