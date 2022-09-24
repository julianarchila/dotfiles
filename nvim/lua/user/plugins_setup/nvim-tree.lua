local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  actions = {
    use_system_clipboard = true,
    open_file = {
      quit_on_open = true,
    },
  },
}
