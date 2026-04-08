
local status, indentBlankline = pcall(require, "ibl")
if not status then
    print("Error: It seems that indent-blankline plugin is not installed")
    print(indentBlankline)
end

indentBlankline.setup({})
