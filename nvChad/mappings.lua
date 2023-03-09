local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

  -- Navigate buffers
    ["<S-l>"] = {"<cmd> bnext <CR>", "switch to next buffer"},
    ["<S-h>"] = {"<cmd> bprevious<CR>", "switch to previous buffer"},
    ["<leader>c"] = {"<cmd> bd<CR>", "Close current buffer"},

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
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
  ["<C-Up>"] = {"<cmd> resize +2 <CR>", "resize +2"},
  ["<C-Down>"] = {"<cmd> resize -2 <CR>", "resize -2"},
  ["<C-Left>"] = {"<cmd> vertical resize -2 <CR>", "vertical resize -2"},
  ["<C-Right>"] = {"<cmd> vertical resize +2 <CR>", "vertical resize +2"},

  },


}

-- more keybinds!

return M
