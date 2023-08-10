
local lspSagaStatus, lspSaga = pcall(require, 'lspsaga')
if not lspSagaStatus then
    print('Error: It seems lspsaga is not installed')
    print(lspSaga)
    return
end

lspSaga.setup({
    preview = {
        lines_above = 10,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = "<C-j>",
        scroll_up = "<C-k>",
    },
    request_timeout = 2000,
})
