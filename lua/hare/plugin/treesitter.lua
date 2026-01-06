return {
    -- This plugin brings tree-sitter-based parsing into the editor, enabling accurate, fast, and
    -- semantic understanding of source code.
    --
    -- [https://github.com/nvim-treesitter/nvim-treesitter]
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
    },
}
