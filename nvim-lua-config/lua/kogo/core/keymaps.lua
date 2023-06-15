
vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jj", "<ESC>")
keymap.set("i", "jJ", "<ESC>")
keymap.set("i", "Jj", "<ESC>")
keymap.set("i", "JJ", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- drop search highlight
keymap.set("n", "*", "*N") -- just highlight word under cursor
keymap.set("n", "#", "#N") -- do not jump to next
keymap.set("n", "n", "nzzzv") -- keep found word at middle of
keymap.set("n", "N", "Nzzzv") -- the screen

keymap.set("n", "x", '"_x') -- do not copy removed character

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- [s]plit windows
keymap.set("n", "<leader>sv", "<C-w>v") -- [v]ertically
keymap.set("n", "<leader>sh", "<C-w>s") -- [h]oriontally
keymap.set("n", "<leader>se", "<C-w>=") -- make [e]qual splits size
keymap.set("n", "<leader>sx", "<C-w>c") -- [c]lose split
keymap.set("n", "<leader>so", "<C-w>o") -- close all splits, except for current
keymap.set("n", "<leader><leader>", "<C-w><C-w>") -- next split

-- [t]abs
keymap.set("n", "<leader>tc", ":tabnew<CR>") -- [c]reate new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabnext<CR>") -- [n]ext tab
keymap.set("n", "<leader>tp", ":tabprev<CR>") -- [p]revious tab
-- go to 'n'th tab
keymap.set("n", "<leader>1", "1gt")
keymap.set("n", "<leader>2", "2gt")
keymap.set("n", "<leader>3", "3gt")
keymap.set("n", "<leader>4", "4gt")
keymap.set("n", "<leader>5", "5gt")
keymap.set("n", "<leader>6", "6gt")
keymap.set("n", "<leader>7", "7gt")
keymap.set("n", "<leader>8", "8gt")
keymap.set("n", "<leader>9", "9gt")

-- Plugins

---- Nvim-tree
keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>j', ':NvimTreeFindFileToggle<CR>')

---- Telescope
local telescopeBuiltin = require('telescope.builtin')
keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, {})
keymap.set('n', '<C-p>', telescopeBuiltin.git_files, {})
keymap.set('n', '<leader>pg', telescopeBuiltin.grep_string, {})
keymap.set('n', '<leader>pG', telescopeBuiltin.live_grep, {})
keymap.set('n', '<leader>pr', telescopeBuiltin.lsp_references, {})
keymap.set('n', '<leader>pb', telescopeBuiltin.buffers, {})
keymap.set('n', '<leader>ph', telescopeBuiltin.help_tags, {})

