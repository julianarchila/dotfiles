-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Mason
    use { 'williamboman/mason.nvim' } -- Optional

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- THEMES
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use 'Mofiqul/vscode.nvim'


    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    -- LSP ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Autopairs, integrates with both cmp and treesitter
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }
    -- File nav
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Comments
    use { "numToStr/Comment.nvim",
        requires = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        }
    }


    ---COPILOT---
    use { "zbirenbaum/copilot.lua" }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    --cmd icons
    use("onsails/lspkind.nvim")

    -- transparent
    use { "xiyaowong/transparent.nvim",
        config = function() require("transparent").setup() end,

        run = ':TransparentEnable'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- cpbooster
    use("searleser97/cpbooster.vim")

    if packer_bootstrap then
        require('packer').sync()
    end

    -- Debugger
    use {
        "mfussenegger/nvim-dap"
    }
    use { "jay-babu/mason-nvim-dap.nvim",
        requires = { "williamboman/mason.nvim" }
    }


    use { "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" }
    }

    use { "Shatur/neovim-tasks", requires = "nvim-lua/plenary.nvim" }



    -- formatter
    use { "nvimdev/guard.nvim",
        requires = {
            "nvimdev/guard-collection"
        }
    }
end)
