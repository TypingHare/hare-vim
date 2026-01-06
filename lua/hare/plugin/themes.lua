return {
    -- [https://github.com/ribru17/bamboo.nvim]
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
                style = 'vulgaris',
                transparent = true,
                lualine = { transparent = true },
            }
            require('bamboo').load()
        end,
    },

    -- [https://github.com/catppuccin/nvim]
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavour = 'mocha',
            transparent_background = true,
            integrations = { bufferline = true },
        },
    },
}
