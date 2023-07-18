-------------------------------------
----- LSP-ZERO/CMP CONFIGURATION ----
-------------------------------------



local lsp = require('lsp-zero')
lsp.preset('recommended')

-- This calles Mason and installs the language servers
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'lua_ls'
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

-- CMP CONFIG
local cmp = require('cmp')


-- util
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
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
        if cmp.visible() then
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

        { name = "copilot", group_index = 2 },

        -- Recommended sources from lsp-zero
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },

    }
})


--Autopairs
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
