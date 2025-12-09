require 'hare'

-- Turn on highlight
---@diagnostic disable-next-line missing-fields
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = { 'latex' },
    },
}
