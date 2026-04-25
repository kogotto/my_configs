
local masonDapStatus, masonDap = pcall(require, 'mason-nvim-dap')
if not masonDapStatus then
    print('Error: It seems mason-nvim-dap is not installed')
    print(masonDap)
    return
end

masonDap.setup({
    handlers = {},
})
