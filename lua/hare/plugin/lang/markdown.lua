return {
    -- This plugin adds a rich visual UI for Markdown preview and navigation inside the editor.
    --
    -- [https://github.com/OXY2DEV/markview.nvim]
    {
        'OXY2DEV/markview.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'saghen/blink.cmp',
        },
        opts = {
            preview = {
                enable = false,
                filetypes = { 'markdown', 'md' },
            },
        },
        config = true,
    },
}
