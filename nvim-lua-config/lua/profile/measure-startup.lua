if vim.env.PROF then
    local snacksPath = vim.fn.stdpath("data") .. '/lazy/snacks.nvim'
    vim.opt.rtp:append(snacksPath)
    local status, profiler = pcall(require, 'snacks.profiler')
    if not status then
        print('snacks.profiler not found')
        print(profiler)
        return
    end
    profiler.startup({
        startup = {
            event = 'UIEnter',
        },
    })
end
