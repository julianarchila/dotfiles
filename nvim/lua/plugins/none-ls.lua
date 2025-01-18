return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      --[[ local command_resolver = require("null-ls.helpers.command_resolver")

    local prettier = null_ls.builtins.formatting.prettier.with({
      -- old
      -- dynamic_command = command_resolver.from_node_modules,

      -- new
      dynamic_command = command_resolver.from_node_modules(),
    }) ]]

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,

          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.diagnostics.golangci_lint,
        },
      })

      -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ timeout_ms = 2000 })
      end, {})
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "prettierd", "clang_format", "golangci_lint" },
      })
    end,
  },
}
