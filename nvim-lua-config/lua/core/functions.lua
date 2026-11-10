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

local FORWARD = 'FORWARD'
local BACKWARD = 'BACKWARD'

local isForward = function(direction)
    if direction == FORWARD then
        return true
    elseif direction == BACKWARD then
        return false
    else
        error('Invalid direction: ' .. direction)
    end
end

local function highlightAndSetSearch(format, direction)
    local word = vim.fn.expand('<cword>')
    local escapedWord = vim.fn.escape(word, '\\/.*$^~[]')
    vim.fn.setreg('/', string.format(format, escapedWord))
    vim.v.searchforward = isForward(direction) and 1 or 0
    vim.opt.hlsearch = true
end

local STRICT_FORMAT = '\\V\\<%s\\>'
local WEAK_FORMAT = '\\V%s'

M.justHightlightStrictForward = function()
    highlightAndSetSearch(STRICT_FORMAT, FORWARD)
end

M.justHightlightStrictBackward = function()
    highlightAndSetSearch(STRICT_FORMAT, BACKWARD)
end

M.justHightlightWeakForward = function()
    highlightAndSetSearch(WEAK_FORMAT, FORWARD)
end

M.justHightlightWeakBackward = function()
    highlightAndSetSearch(WEAK_FORMAT, BACKWARD)
end

return M
