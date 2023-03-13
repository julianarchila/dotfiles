local M = {}

M.ui = {
	-- hl = highlights
	theme_toggle = { "vscode_dark", "gruvbox_light" },
	theme = "vscode_dark", -- default theme
	transparency = false,
}

M.mappings = require("custom.mappings")
M.plugins = require("custom.plugins")
return M
