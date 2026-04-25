
local dapStatus, dap = pcall(require, 'dap')
if not dapStatus then
    print('Error: It seems nvim-dap is not installed')
    print(dap)
    return
end

local dapUiStatus, dapUi = pcall(require, 'dapui')
if not dapUiStatus then
    print('Error: It seems nvim-dap-ui is not installed')
    print(dapUi)
    return
end

dapUi.setup()
dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapUi.open()
end
dap.listeners.before.event_initialized["dapui_config"] = function ()
    dapUi.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapUi.close()
end
