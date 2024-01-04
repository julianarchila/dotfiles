return {
	"olexsmir/gopher.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("gopher").setup({})
	end,

  build = function ()
    vim.cmd [[silent! GoInstallDeps]]
  end
}
