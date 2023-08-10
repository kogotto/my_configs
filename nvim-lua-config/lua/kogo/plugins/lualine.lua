
local status, lualine = pcall(require, "lualine")
if not status then
    print("Error: It seems that lualine plugin is not installed")
    print(lualine)
    return
end

lualine.setup()
