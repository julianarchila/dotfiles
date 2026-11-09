return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			return
		end

		comment.setup({
			toggler = {
				line = "<C-/>",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "<C-/>",
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
