local M = {}

M.global = function()
    local keymapSetter = {
        opts = {
            silent = true,
            remap = false,
        },
    }

    local mt = {}
    function mt:__call(modes, keys, action, description)
        self.opts.desc = description or tostring(action)
        vim.keymap.set(modes, keys, action, self.opts)
    end

    setmetatable(keymapSetter, mt)
    return keymapSetter
end

function M.buffer(bufnr)
    local setter = {
        opts = {
            silent = true,
            remap = false,
            buffer = bufnr,
        },
    }

    local mt = {}
    function mt:__call(modes, keys, action, description)
        self.opts.desc = description or tostring(action)
        vim.keymap.set(modes, keys, action, self.opts)
    end
    return setmetatable(setter, mt)
end

return M
