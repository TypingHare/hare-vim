return {
    -- This plugin provides GitHub Copilot integration for Neovim.
    --
    -- [https://github.com/github/copilot.vim]
    {

        'github/copilot.vim',
        event = 'InsertEnter',
    },

    -- This plugin provides surrounding text objects functionality for Neovim.
    --
    -- [https://github.com/kylechui/nvim-surround]
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        confit = true,
    },

    -- This plugin provides a search and replace panel for Neovim.
    --
    -- [https://github.com/nvim-pack/nvim-spectre]
    {
        'nvim-pack/nvim-spectre',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = 'Spectre',
    },
}
