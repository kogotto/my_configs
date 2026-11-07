vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Blink', { clear = true, }),
    callback = function() vim.hl.on_yank({ timeout = 300, }) end,
})
