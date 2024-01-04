return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    require("cmake-tools").setup({
      cmake_build_directory = "build/${variant:buildType}",
      cmake_runner = {                 -- runner to use
        name = "quickfix",             -- name of the runner
        opts = {},                     -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = {               -- a list of default and possible values for runners
          quickfix = {
            show = "always",           -- "always", "only_on_error"
            position = "belowright",   -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
            size = 20,
            encoding = "utf-8",        -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
            auto_close_when_success = false, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
          },

          terminal = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            split_direction = "vertical", -- "horizontal", "vertical"
            split_size = 30,

            focus = true, -- Focus on terminal when cmake task is launched.
          },
        },
      },
    })

    -- KEYMAPS

    -- vim.keymap.set("n", "<C-[>", "<cmd>CMakeDebug<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-y>", "<cmd>CMakeRun<CR>", { noremap = true, silent = true })
  end,
}
