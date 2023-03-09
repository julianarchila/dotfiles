local M = {}
M.cmp = function()
   -- vim.opt.completeopt = "menu,menuone,noselect,noinsert"
   return {
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
end

return M
