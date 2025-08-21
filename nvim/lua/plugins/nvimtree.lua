return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional
	},

	config = function()
		require("nvim-tree").setup({
			actions = {
				use_system_clipboard = true,
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
	end,
}
