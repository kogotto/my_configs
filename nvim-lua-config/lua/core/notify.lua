local M = {}

-- Try to show debug notification. It will be shown only if
-- Snacks.notifier has appropriate level. But in history it will be anyway
local function _notify(level, formatStr, ...)
    Snacks.notify(string.format(formatStr, ...), {
        level = level,
    })
end

M.debug = function(formatStr, ...)
    _notify('debug', formatStr, ...)
end

M.info = function(formatStr, ...)
    _notify('info', formatStr, ...)
end

M.warn = function(formatStr, ...)
    _notify('warn', formatStr, ...)
end

M.error = function(formatStr, ...)
    _notify('error', formatStr, ...)
end

return M
