local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"java",
		"cpp",
		"typescript",
		"go",
		"tsx",
		"python",
	},
}

M.cmp = {
	-- preselect = cmp.PreselectMode.None,
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

M.mason = {
	ensure_installed = {

		"autoflake",
		"autopep8",
		"black",
		"clangd",
		"cpptools",
		"eslint_d",
		"flake8",
		"google-java-format",
		"jdtls",
		"lua-language-server",
		"markdownlint",
		"prettier",
		"prettierd",
		"pyright",
		"stylua",
		"typescript-language-server",
	},
}

return M
