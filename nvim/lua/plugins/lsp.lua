local servers = {
  "lua_ls",
  "tailwindcss",
  "clangd",
  "html",
  "pyright",
  "gopls",
  "phpactor",
  "cmake",
  "glsl_analyzer",
  "biome",
  "jsonls"
}

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = servers,
    })

    -- enable servers
    for _, server in pairs(servers) do
      vim.lsp.enable(server)
    end


  end,
}
