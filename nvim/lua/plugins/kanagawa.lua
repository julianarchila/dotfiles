return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "lotus",
			},
		})
		vim.cmd("colorscheme kanagawa")
	end,
}
