local opts = {
    silent = true,
    remap = false,
}
local function setKeymap(modes, keys, action, description)
    opts.desc = description or tostring(action)
    vim.keymap.set(modes, keys, action, opts)
end

-- general
local descriptionOfjj = 'Faster way to quit insert mode'
setKeymap("i", "jj", "<ESC>", descriptionOfjj)
setKeymap("i", "jJ", "<ESC>", descriptionOfjj)
setKeymap("i", "Jj", "<ESC>", descriptionOfjj)
setKeymap("i", "JJ", "<ESC>", descriptionOfjj)

setKeymap("n", "<leader>h", ":nohlsearch<CR>", 'Drop search highlight')
local searchNextDescription = 'Keep found word at the center of the screan'
setKeymap("n", "n", "nzzzv", searchNextDescription)
setKeymap("n", "N", "Nzzzv", searchNextDescription)

setKeymap("n", "<leader>x", ":! chmod +x %<CR>", 'Make current file executable')

-- [s]plit windows
setKeymap("n", "<leader>sv", "<C-w>v", 'Split vertically')
setKeymap("n", "<leader>sh", "<C-w>s", 'Split horizontally')
setKeymap("n", "<leader>se", "<C-w>=", 'Make splits equal in size')
setKeymap("n", "<leader>sx", "<C-w>c", 'Kill current split')
setKeymap("n", "<leader>so", "<C-w>o", 'Kill all other splits')
setKeymap("n", "<leader><leader>", "<C-w><C-w>", 'Go to next split')

-- [t]abs
setKeymap("n", "<leader>tc", ":tabnew<CR>", 'Create new tab')
setKeymap("n", "<leader>tx", ":tabclose<CR>", 'Kill current tab')
setKeymap("n", "<leader>to", ":tabonly<CR>", 'Kill all other tabs')
setKeymap("n", "<leader>tn", ":tabnext<CR>", 'Go to next tab')
setKeymap("n", "<leader>tp", ":tabprev<CR>", 'Go to previous tab')
setKeymap("n", "<leader>tm", "<C-w>T", 'Move current window to new tab')
setKeymap("n", "<leader>ty", "<C-w>s<C-w>T", 'Clone current window in new tab')
-- go to 'n'th tab
setKeymap("n", "<leader>1", "1gt", 'Go to tab 1')
setKeymap("n", "<leader>2", "2gt", 'Go to tab 2')
setKeymap("n", "<leader>3", "3gt", 'Go to tab 3')
setKeymap("n", "<leader>4", "4gt", 'Go to tab 4')
setKeymap("n", "<leader>5", "5gt", 'Go to tab 5')
setKeymap("n", "<leader>6", "6gt", 'Go to tab 6')
setKeymap("n", "<leader>7", "7gt", 'Go to tab 7')
setKeymap("n", "<leader>8", "8gt", 'Go to tab 8')
setKeymap("n", "<leader>9", "9gt", 'Go to tab 9')

local functions = require('core.functions')
setKeymap('n', '<leader>ft', functions.printFiletype, 'Just show filetype in cmdline')
setKeymap('n', '<leader>dab', functions.deleteAllHiddenBuffers, 'Delete all windowless buffers')

setKeymap('n', '*', functions.justHightlightStrictForward, 'Highlight word without jumping and search forward')
setKeymap('n', '#', functions.justHightlightStrictBackward, 'Highlight word without jumping and search backward')
setKeymap('n', 'g*', functions.justHightlightWeakForward, 'Highlight word without jumping and search forward')
setKeymap('n', 'g#', functions.justHightlightWeakBackward, 'Highlight word without jumping and search backward')
