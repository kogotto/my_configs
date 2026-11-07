local M = {}

local function atLeastOneWindow(bufnr)
    for _, _ in pairs(vim.fn.win_findbuf(bufnr)) do
        return true
    end
    return false
end

local function hasWindows(bufnr)
    return vim.api.nvim_buf_is_valid(bufnr) and
           vim.bo[bufnr].buflisted and
           atLeastOneWindow(bufnr)
end

local function deleteAllHiddenBuffers()
    local api = vim.api
    local buffers = api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        if not hasWindows(bufnr) then
            api.nvim_buf_delete(bufnr, { force = false, })
        end
    end
end

M.deleteAllHiddenBuffers = deleteAllHiddenBuffers

M.printFiletype = function()
    print('filetype ' .. vim.bo.filetype)
end

return M
