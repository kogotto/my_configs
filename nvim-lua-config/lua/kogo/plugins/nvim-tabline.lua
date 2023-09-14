
local status, tabline = pcall(require, "tabline")
if not status then
    print("Error: It seems that tabline plugin in not installed")
    print(tabline)
    return
end

tabline.setup({})
