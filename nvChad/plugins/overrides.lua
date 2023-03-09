local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "java",
    "cpp",
    "typescript",
    "go",
    "tsx",
    "python"
  },
}

M.cmp = {
    -- preselect = cmp.PreselectMode.None,
    sources = {
       { name = "copilot" },
       { name = "nvim_lsp" },
       { name = "luasnip" },
       { name = "buffer" },
       { name = "nvim_lua" },
       { name = "path" },
    },
   }
return M
