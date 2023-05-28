
-- This will automatically install packer on startup, if neaded
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Autocommand that reloads nvim wherever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, 'packer')
if not status then
    return
end

return packer.startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use('morhetz/gruvbox')

    -- Tree explorer
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons') -- Cool icons for filetypes in tree

    -- Cool statusline
    use('nvim-lualine/lualine.nvim')

    -- Cool way to search/grep files, buffers
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Code highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Easy commet out
    use('tpope/vim-commentary')
    -- Easy surroundings
    use('tpope/vim-surround')
    -- git integration
    use('tpope/vim-fugitive')

    -- Lsp servers manager
    use('williamboman/mason.nvim', {run = function() pcall(vim.cmd, 'MasonUpdate') end})
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},              -- Autocompletion engine

            {'L3MON4D3/LuaSnip'},              -- Snippet engine
            {'saadparwaiz1/cmp_luasnip'},      -- nvim-cmp source for engine above
            {'rafamadriz/friendly-snippets'},  -- Snippet collection

            {'hrsh7th/cmp-path'},              -- nvim-cmp source for filepaths
            {'hrsh7th/cmp-buffer'},            -- nvim-cmp source for words from open files

            {'hrsh7th/cmp-nvim-lsp'}, -- Required
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
