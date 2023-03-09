local overrides = require("custom.plugins.overrides")

print("checkpoint")

local plugins = {

	["zbirenbaum/copilot.lua"] = {
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({})
			end, 100)
		end,
	},
	["zbirenbaum/copilot-cmp"] = {
		after = {
			"copilot.lua",
			"nvim-cmp",
		},
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	--CMP
	["hrsh7th/nvim-cmp"] = {
		override_options = overrides.cmp,
	},
	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},
	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["NvChad/ui"] = {
		override_options = {
			tabufline = {
				lazyload = false, -- to show tabufline by default
			},
		},
	},
}

return plugins
