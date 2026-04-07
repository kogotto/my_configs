
local status, autoClose = pcall(require, "autoclose")
if not status then
    print("Error: It seems that autoclose plugin is not installed")
    print(autoClose)
    return
end

autoClose.setup()
