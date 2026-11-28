-- Add short blink after each yank. Only yanked highlighted for 300 ms
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Blink', { clear = true, }),
    callback = function() vim.hl.on_yank({ timeout = 300, }) end,
})

-- Make indentation in frontend files by 2 spaces
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'html',
        'css',
        'javascript',
        'typescript',
        'json',
        'yaml',
    },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
    end
})
