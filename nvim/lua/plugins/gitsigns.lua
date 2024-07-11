return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    })
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
    vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame)
  end,
}
