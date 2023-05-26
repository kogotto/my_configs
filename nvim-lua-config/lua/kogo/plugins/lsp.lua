
local status, lsp = pcall(require, "lsp-zero")
if not status then
    print('Error: It seems that lsp-zero is not installed')
    return
end

lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
