
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

    -- Autocompletion
    use('hrsh7th/nvim-cmp')              -- Autocompletion engine

    use('L3MON4D3/LuaSnip')              -- Snippet engine
    use('saadparwaiz1/cmp_luasnip')      -- nvim-cmp source for engine above
    use('rafamadriz/friendly-snippets')  -- Snippet collection

    use('hrsh7th/cmp-path')              -- nvim-cmp source for filepaths
    use('hrsh7th/cmp-buffer')            -- nvim-cmp source for words from open files

    -- Lsp servers manager
    use('williamboman/mason.nvim', {run = function() pcall(vim.cmd, 'MasonUpdate') end})
    use('williamboman/mason-lspconfig.nvim')

    -- Configuring lsp servers
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')          -- nvim-cmp source for lsp
    use({                                -- lsp ui
        'glepnir/lspsaga.nvim',
        branch = 'main'
    })
    use('onsails/lspkind.nvim')         -- add devicons to lsp

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
