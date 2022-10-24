return {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--completion-style=bundled",
    "--header-insertion=iwyu"
  },
  flags = {debounce_text_changes = 150},

  clangd_capabilities = {
    offsetEncoding = {"utf-8", "utf-16"},
  }

}
