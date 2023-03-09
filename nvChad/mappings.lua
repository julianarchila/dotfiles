local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- Shortcut to open a file in a new tab
		["<leader>tt"] = { "<cmd> tabnew <CR>", "open a new tab" },
		["<leader>tn"] = { "<cmd> tabnew <CR>", "open a new tab" },
		["<leader>to"] = { "<cmd> tabonly <CR>", "close all other tabs" },
		["<leader>tc"] = { "<cmd> tabclose <CR>", "close current tab" },
		["<leader>tm"] = { "<cmd> tabmove <CR>", "move current tab" },
		["<leader>tr"] = { "<cmd> tabnext <CR>", "move to next tab" },
		["<leader>tl"] = { "<cmd> tabprevious <CR>", "move to previous tab" },
		["<leader>th"] = { "<cmd> tabfirst <CR>", "move to first tab" },
		["<leader>te"] = { "<cmd> tablast <CR>", "move to last tab" },
		["<leader>ts"] = { "<cmd> tabsplit <CR>", "split current tab" },
		["<leader>tv"] = { "<cmd> vsplit <CR>", "split current tab vertically" },

		-- Window management
		["<leader>w"] = { "<cmd> w <CR>", "save current file" },
		["<leader>q"] = { "<cmd> q <CR>", "close current file" },
		["<leader>wq"] = { "<cmd> wq <CR>", "save and close current file" },

		-- Resize with arrows

		["<C-Up>"] = { "<cmd> resize +2 <CR>", "resize +2" },
		["<C-Down>"] = { "<cmd> resize -2 <CR>", "resize -2" },
		["<C-Left>"] = { "<cmd> vertical resize -2 <CR>", "vertical resize -2" },
		["<C-Right>"] = { "<cmd> vertical resize +2 <CR>", "vertical resize +2" },
	},
}

M.tabufline = {
	plugin = true,

	n = {
		-- Navigate buffers
		["<S-h>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},
		["<S-l>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},

		["<leader>c"] = {
			function()
				require("nvchad_ui.tabufline").close_buffer()
			end,
			"close buffer",
		},
	},
}

M.lsp = {

	n = {
		["<leader>k"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"diagnostic setloclist",
		},
		["<leader>i"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"floating diagnostic",
		},
		["<leader>f"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<C-_>"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["<C-_>"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

-- more keybinds!
M.telescope = {
	plugin = true,

	n = {
		-- find
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<C-P>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
	},
}

return M
