local M = {}

M.ui = {
  -- hl = highlights
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
}

M.mappings = require "custom.mappings"
M.plugins = require "custom.plugins"
return M
