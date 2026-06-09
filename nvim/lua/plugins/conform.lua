return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  dependencies = {
    "mason-org/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Replaces the old none-ls/mason-null-ls install step for formatters.
    require("mason-tool-installer").setup({
      ensure_installed = { "stylua", "prettierd", "oxfmt", "clang-format", "goimports" },
    })

    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- oxfmt (oxc) handles JS/TS/JSON; prettier(d) keeps the rest.
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        json = { "oxfmt" },
        jsonc = { "oxfmt" },
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "goimports", "gofmt" },
      },
    })

    -- Manual format (matches the previous <leader>f behaviour). Falls back to
    -- LSP formatting when no conform formatter is configured for the filetype.
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({ async = true, lsp_format = "fallback", timeout_ms = 2000 })
    end, { desc = "Format buffer" })
  end,
}
