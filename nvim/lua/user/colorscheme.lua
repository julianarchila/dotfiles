local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


vim.opt["background"] = "dark"
vim.g["gruvbox_material_background"] = "hard"
vim.g["gruvbox_material_better_performance"] = 1
--vim.cmd "g:gruvbox_material_background='medium'"

--vim.cmd "let g:gruvbox_material_better_performance = 1"
