local status, _ = pcall(vim.cmd, "colorscheme nordic")
if not status then
    print("Cannot find colorscheme. Did you install one?")
    print(_)
    return
end

