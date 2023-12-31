local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact'):fmt('prettier')



-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
})
