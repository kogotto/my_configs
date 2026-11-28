local M = {}

local mt = {}
function mt:__call(modes, keys, action, description)
    self.opts.desc = description or tostring(action)
    vim.keymap.set(modes, keys, action, self.opts)
end

local function commonOpts()
    return {
        silent = true,
        remap = false,
    }
end

M.global = function()
    return setmetatable({ opts = commonOpts(), }, mt)
end

M.buffer = function(bufnr)
    local opts = commonOpts()
    opts.buffer = bufnr

    return setmetatable({ opts = opts, }, mt)
end

return M
