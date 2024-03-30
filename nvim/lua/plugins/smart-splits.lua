return {
  "mrjones2014/smart-splits.nvim",

  config = function()
    require("smart-splits").setup({
      multiplexer_integration = nil,
    })

    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
  end,
}
