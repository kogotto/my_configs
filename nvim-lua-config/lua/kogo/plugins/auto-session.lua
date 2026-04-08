
local status, autoSession = pcall(require, "auto-session")
if not status then
    print("Error: It seems that auto-session plugin is not installed")
    print(autoSession)
    return
end

autoSession.setup({})
