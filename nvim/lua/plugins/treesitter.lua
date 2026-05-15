local parsers = {
  "lua", "vim", "vimdoc", "query", "regex",
  "bash", "markdown", "markdown_inline",
  "javascript", "typescript", "tsx", "jsdoc",
  "html", "css", "json", "yaml", "toml",
  "go", "gomod", "gosum",
  "python",
  "c", "cpp", "cmake",
  "rust",
  "dockerfile",
  "sql",
  "gitcommit", "gitignore",
  "elixir", "erlang", "gleam",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local bufnr = args.buf
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        local file_size = vim.fn.getfsize(buf_name)
        if file_size > 256 * 1024 then
          return
        end

        local ok = pcall(vim.treesitter.start, bufnr)
        if ok then
          vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
