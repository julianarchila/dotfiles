local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup({
  toggler = {
    line = "<C-_>",
    block = "gbc",
  },
  opleader = {
    line = "<C-_>",
  }
})

