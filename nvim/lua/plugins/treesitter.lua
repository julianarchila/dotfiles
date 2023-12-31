return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local tsconfig = require("nvim-treesitter.configs")

		tsconfig.setup({
			ensure_installed = { "lua", "javascript" },
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
