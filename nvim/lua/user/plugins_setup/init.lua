local safe_require = require("user.utils").safe_require

local modules = {"toggleterm","comment", "autopairs", "nvim-tree", "bufferline", "telescope", "treesitter", "cmp"}

for _, module in ipairs(modules) do
    safe_require("user.plugins_setup." .. module)
end


