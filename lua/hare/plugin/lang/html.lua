return {
    -- This plugin automatically manages paired HTML/XML/JSX tags using tree-sitter.
    --
    -- [https://github.com/windwp/nvim-ts-autotag]
    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = true,
    },
}
