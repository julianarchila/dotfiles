-- Configure mason-nvim-dap
require("mason-nvim-dap").setup({
    ensure_installed = { "python", "delve", "codelldb" , "node2"},
    handlers = {}
})

-- Configure nvim-dap-ui

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Keybindings

vim.keymap.set('n', '<leader>db', ":DapToggleBreakpoint<cr>", {})

vim.keymap.set('n', '<leader>dr', ":DapContinue<cr>", {})
