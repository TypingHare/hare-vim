-- Neovim tree-sitter configuration.
--
-- [https://github.com/nvim-treesitter/nvim-treesitter]
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
}
