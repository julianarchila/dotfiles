-------------------------------------
----- LSP-ZERO/CMP CONFIGURATION ----
-------------------------------------



local lsp = require('lsp-zero')
lsp.preset('minimal')

-- This calles Mason and installs the language servers
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'lua_ls',
    "pyright",
    "clangd",
    "tailwindcss",
    "emmet_language_server",
    "eslint",
    "jsonls"
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


-- LSP mappigns
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

---------------------------------------
------- Language Server Configs -------
---------------------------------------

--eslint
local util = require("lspconfig.util")
local root_file = {
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  'eslint.config.js',
}

require("lspconfig").eslint.setup({
    root_dir = function(fname)
      root_file = util.insert_package_json(root_file, 'eslintConfig', fname)
      return util.root_pattern(unpack(root_file))(fname)
    end,
    on_new_config = function(config, new_root_dir)
      -- The "workspaceFolder" is a VSCode concept. It limits how far the
      -- server will traverse the file system when locating the ESLint config
      -- file (e.g., .eslintrc).
      config.settings.workspaceFolder = {
        uri = new_root_dir,
        name = vim.fn.fnamemodify(new_root_dir, ':t'),
      }

      -- Support flat config
      if vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1 then
        config.settings.experimental.useFlatConfig = true
      end

      -- Support Yarn2 (PnP) projects
      local pnp_cjs = util.path.join(new_root_dir, '.pnp.cjs')
      local pnp_js = util.path.join(new_root_dir, '.pnp.js')
      if util.path.exists(pnp_cjs) or util.path.exists(pnp_js) then
        config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
      end
    end

})

--clangd
require("lspconfig").clangd.setup({
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})

-- configure pyright to support poetry virtualenv
local poetry_env_path = vim.fn.trim(vim.fn.system("poetry env info --path"))

require("lspconfig").pyright.setup({
    cmd = {
        "pyright-langserver",
        "--stdio",
        "--venv-path",
        poetry_env_path,
    },
})

-- CMP CONFIG
local cmp = require('cmp')

local lspkind = require('lspkind') -- for cmp icons

-- Add copilot icon to lspkind
lspkind.init({
    symbol_map = {
        Copilot = "",
    },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })


-- UTILS --
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- CMP Mappings ---
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() and has_words_before() then
            cmp.select_next_item()
        elseif check_backspace() then
            fallback()
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
}

-----------
-- SETUP --
-----------
cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = "copilot" },
        { name = 'buffer' },
        { name = 'luasnip' },

    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',  -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    }

})

--Autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
