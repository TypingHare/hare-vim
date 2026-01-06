return {
    -- This plugin manages project-aware configuration system for Neovim, especially for LSPs.
    --
    -- [https://github.com/folke/neoconf.nvim]
    {
        'folke/neoconf.nvim',
        priority = 1000,
        config = true,
    },

    -- This plugin manages central configuration based on neoconf.nvim.
    --
    -- [https://github.com/TypingHare/hare-conf.nvim]
    {
        'typinghare/hare-conf.nvim',
        dependencies = {
            'folke/neoconf.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = true,
    },
}
