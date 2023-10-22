
local status, tree = pcall(require, "nvim-tree")
if not status then
    print("Error: It seems that nvim-tree is not installed")
    print(tree)
    return
end

-- Recomendation from documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = false
            }
        }
    },
    view = {
      width = 50,
    },
})
