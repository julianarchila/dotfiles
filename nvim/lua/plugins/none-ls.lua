return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		--[[ local command_resolver = require("null-ls.helpers.command_resolver")

    local prettier = null_ls.builtins.formatting.prettier.with({
      -- old
      -- dynamic_command = command_resolver.from_node_modules,

      -- new
      dynamic_command = command_resolver.from_node_modules(),
    }) ]]

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				-- prettier,
				null_ls.builtins.diagnostics.eslint_d,
			},
		})

		-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ timeout_ms = 2000 })
		end, {})
	end,
}
