return {
  {
    "sainnhe/gruvbox-material",

    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")
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
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "classic",
        transparent_background = true,
      })
      -- vim.cmd("colorscheme monokai-pro")
    end,
  },
  {
    "datsfilipe/vesper.nvim",

    config = function()
      require("vesper").setup({})
      -- vim.cmd("colorscheme vesper")
    end,
  },
}
