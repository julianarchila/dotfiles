local overrides = require "custom.plugins.overrides"

local plugins = {

  ["zbirenbaum/copilot.lua"] = {
      config = function()
         vim.defer_fn(function()
            require("copilot").setup {
               cmp = {
                  enabled = true,
                  method = "getCompletionsCycling",
               },
            }
         end, 100)
      end,
   },
   ["zbirenbaum/copilot-cmp"] = {},

  --CMP
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
 -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
},
}

return plugins
