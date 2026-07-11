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
  lazy = false,
  -- On the main branch `:TSUpdate` is gone; install/update through the Lua API
  -- and block during the build so parsers exist before the first file opens.
  build = function()
    local ts = require("nvim-treesitter")
    ts.install(parsers):wait(300000)
    ts.update(parsers):wait(300000)
  end,
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})

    -- Start treesitter highlighting (and indentation when available) for a
    -- buffer, but only if a parser is registered for its filetype.
    local function start(bufnr)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end

      local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
      if not lang then
        return
      end

      if not pcall(vim.treesitter.start, bufnr, lang) then
        return
      end

      -- Only opt into treesitter indentation when the parser ships an
      -- `indents` query, otherwise keep the buffer's default indentexpr.
      local ok, query = pcall(vim.treesitter.query.get, lang, "indents")
      if ok and query then
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    -- New buffers: start on FileType (skip very large files).
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user-treesitter-start", { clear = true }),
      callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        if vim.fn.getfsize(name) > 256 * 1024 then
          return
        end
        start(args.buf)
      end,
    })

    -- (Re)start highlighting on buffers that were already loaded — covers files
    -- opened before this config ran or before their parser finished installing,
    -- which is what made some files occasionally render without colors.
    local function start_loaded_buffers()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) and not vim.treesitter.highlighter.active[bufnr] then
          start(bufnr)
        end
      end
    end

    -- Install any parsers missing from disk, then start highlighting once the
    -- async install resolves; if nothing is missing, start immediately.
    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end
    local missing = vim.tbl_filter(function(lang)
      return not installed[lang]
    end, parsers)

    if #missing > 0 then
      ts.install(missing):await(vim.schedule_wrap(start_loaded_buffers))
    else
      start_loaded_buffers()
    end
  end,
}
