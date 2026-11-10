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

M.deleteAllHiddenBuffers = function()
    local api = vim.api
    local buffers = api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        if not hasWindows(bufnr) then
            api.nvim_buf_delete(bufnr, { force = false, })
        end
    end
end

M.printFiletype = function()
    print('filetype ' .. vim.bo.filetype)
end

local function highlightAndSetSearch(reg, format)
    local word = vim.fn.expand('<cword>')
    local escapedWord = vim.fn.escape(word, '\\/')
    vim.fn.setreg(reg, string.format(format, escapedWord))
    vim.opt.hlsearch = true
end

local FORWARD_REGISTER = '/'
local BACKWARD_REGISTER = '?'
local STRICT_FORMAT = '\\V\\<%s\\>'
local WEAK_FORMAT = '\\V%s'

M.justHightlightStrictForward = function()
    highlightAndSetSearch(FORWARD_REGISTER, STRICT_FORMAT)
end

M.justHightlightStrictBackward = function()
    highlightAndSetSearch(BACKWARD_REGISTER, STRICT_FORMAT)
end

M.justHightlightWeakForward = function()
    highlightAndSetSearch(FORWARD_REGISTER, WEAK_FORMAT)
end

M.justHightlightWeakBackward = function()
    highlightAndSetSearch(BACKWARD_REGISTER, WEAK_FORMAT)
end

return M
