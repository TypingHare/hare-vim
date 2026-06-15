return {
    -- This plugin manages project-aware configuration system for Neovim,
    -- especially for LSPs.
    --
    -- [https://github.com/folke/neoconf.nvim]
    {
        'folke/neoconf.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        priority = 1000,
        config = true,
    },
}
