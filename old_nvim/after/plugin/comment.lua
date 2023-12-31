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
        line = "gc",
        block = "<C-_>",
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

})
