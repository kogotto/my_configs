
local status, cinnamon = pcall(require, "cinnamon")
if not status then
    print("Error: It seems that cinnamon plugin is not installed")
    print(cinnamon)
    return
end

cinnamon.setup({
    keymaps = {
        basic = true,
        extra = true,
    },

    options = {
        mode = 'window',
        max_delta = {
            time = 500,
        },
    },
})
