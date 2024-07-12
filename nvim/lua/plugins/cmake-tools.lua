return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    require("cmake-tools").setup({
      cmake_build_directory = "build/${variant:buildType}",
      cmake_runner = {          -- runner to use
        name = "toggleterm",    -- name of the runner
        opts = {},              -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = {        -- a list of default and possible values for runners
          toggleterm = {
            direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false, -- whether close the terminal when exit
            auto_scroll = true, -- whether auto scroll to the bottom
            singleton = true,   -- single instance, autocloses the opened one, if present
          },
        },
      },
    })

    -- KEYMAPS

    -- vim.keymap.set("n", "<C-[>", "<cmd>CMakeDebug<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-y>", "<cmd>CMakeRun<CR>", { noremap = true, silent = true })
  end,
}
