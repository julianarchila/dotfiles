require("nvim-tree").setup({
    actions = {
        use_system_clipboard = true,
        open_file = {
            quit_on_open = true,
        },
    },
    filters = {
        git_ignored = false,
        dotfiles = false,
    }
})
