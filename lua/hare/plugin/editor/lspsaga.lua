return {
    'nvimdev/lspsaga.nvim',
    enabled = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        lightbulb = {
            enable = false,
        },
    },
    config = true,
}
