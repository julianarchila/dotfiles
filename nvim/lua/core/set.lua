vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "false"

vim.g.mapleader = " "

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- FOLDS reference: https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
--[[ vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4 ]]

-- Fold Keymaps:
--[[
  zf#j creates a fold from the cursor down # lines.
  zf/string creates a fold from the cursor to string .
  zj moves the cursor to the next fold.
  zk moves the cursor to the previous fold.
  zo opens a fold at the cursor.
  zO opens all folds at the cursor.
  zm increases the foldlevel by one.
  zM closes all open folds.
  zr decreases the foldlevel by one.
  zR decreases the foldlevel to zero -- all folds will be open.
  zd deletes the fold at the cursor.
  zE deletes all folds.
  [z move to start of open fold.
  ]z move to end of open fold.
]]
-- Reference: https://gist.github.com/lestoni/8c74da455cce3d36eb68
