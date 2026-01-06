return {
    -- This plugin modernizes how messages, command-line input, notifications, and LSP feedback are
    -- displayed.
    --
    -- [https://github.com/folke/noice.nvim]
    {
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
        event = 'VeryLazy',
        config = true,
    },

    -- This plugin is a notification manager for Neovim that replaces the built-in vim.notify UI
    -- with stylish, asynchronous, pop-up notifications. It is designed to make errors, warnings,
    -- info messages, and plugin feedback clearer and less disruptive.
    --
    -- [https://github.com/rcarriga/nvim-notify]
    {
        'rcarriga/nvim-notify',
        lazy = false,
        config = function()
            local notify = require 'notify'
            notify.setup {
                max_width = 80,
            }

            vim.notify = notify
        end,
    },
}
