return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	config = function()
		-- Hand blink.cmp completion capabilities to tsserver. typescript-tools
		-- configures its own LSP client, so the global `vim.lsp.config("*")`
		-- capabilities do not reach it — pass them explicitly here.
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("typescript-tools").setup({
			capabilities = capabilities,
			settings = {
				-- Performance: run a separate server just for diagnostics so a
				-- busy project does not block completions/hover.
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",

				-- JSX auto-closing tags
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},

				tsserver_file_preferences = {
					-- Inlay hints
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					-- Auto imports
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},

				tsserver_format_options = {
					insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
					semicolons = "insert",
				},

				complete_function_calls = true,
				include_completions_with_insert_text = true,
				code_lens = "off",
				disable_member_code_lens = true,
				tsserver_max_memory = 12288,
			},
		})
	end,
}
