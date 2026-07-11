return {
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },

    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "delve" },
        handlers = {},
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    dependencies = {"nvim-neotest/nvim-nio"},
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      --[[ dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end ]]
      --[[ dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end ]]
      -- Keybindings
      vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<cr>", {})

      vim.keymap.set("n", "<leader>dr", ":DapContinue<cr>", {})

      vim.keymap.set("n", "<leader>do", ":DapStepOver<cr>", {})
      vim.keymap.set("n", "<leader>di", ":DapStepInto<cr>", {})

      vim.keymap.set("n", "<leader>dc", function()
        dapui.close()
      end, {})
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  }
}
