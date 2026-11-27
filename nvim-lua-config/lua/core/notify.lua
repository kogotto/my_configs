local M = {}

-- Try to show debug notification. It will be shown only if
-- Snacks.notifier has appropriate level. But in history it will be anyway
M.debug = function(formatStr, ...)
    Snacks.notify(string.format(formatStr, ...), {
        level = 'debug',
    })
end

return M
