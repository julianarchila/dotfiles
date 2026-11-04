-- Ctrl-h/j/k/l moves between splits, then into the tmux or Rex pane beyond
-- the edge. Rex hands these keys to Vim (home/.config/rex/init.lua), so Vim
-- calls `rex focus` itself when it can't move any further.

local function rex_navigate(wincmd, direction)
  local before = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() == before then
    local bin = vim.env.REX_BIN_DIR and (vim.env.REX_BIN_DIR .. "/rex") or "rex"
    vim.fn.jobstart({ bin, "focus", direction })
  end
end

local function navigate(wincmd, direction, tmux_cmd)
  return function()
    if vim.env.REX_BLOCK and not vim.env.TMUX then
      rex_navigate(wincmd, direction)
    else
      vim.cmd(tmux_cmd)
    end
  end
end

return {
  "christoomey/vim-tmux-navigator",

  vim.keymap.set("n", "<C-h>", navigate("h", "left", "TmuxNavigateLeft")),
  vim.keymap.set("n", "<C-j>", navigate("j", "down", "TmuxNavigateDown")),
  vim.keymap.set("n", "<C-k>", navigate("k", "up", "TmuxNavigateUp")),
  vim.keymap.set("n", "<C-l>", navigate("l", "right", "TmuxNavigateRight")),
}
