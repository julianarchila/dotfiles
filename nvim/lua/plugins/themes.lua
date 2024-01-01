return {
  {
    "sainnhe/gruvbox-material",

    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_bold = 1
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      })
      -- vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.o.background = "dark"
      require("vscode").setup({
        disable_nvimtree_bg = true,
      })
      -- vim.cmd("colorscheme vscode")
    end,
  },
}
