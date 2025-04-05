local servers = {
  "lua_ls",
  "tailwindcss",
  "ts_ls",
  "clangd",
  "html",
  "pyright",
  "gopls",
  "phpactor",
  "cmake",
  "glsl_analyzer",
  "eslint",
  "biome",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Add folding capabilities required by ufo.nvim
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local lspconfig = require("lspconfig")

      -- Configure servers defined in the list
      for _, lsp in ipairs(servers) do
        -- do something different for clangd
        if lsp == "clangd" then
          lspconfig[lsp].setup({
            capabilities = capabilities,
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            },
          })
        else
          lspconfig[lsp].setup({
            capabilites = capabilities,
          })
        end
      end

      -- Configure gleam
      lspconfig.gleam.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      --[[ vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end) ]]
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
    end,
  },
}
