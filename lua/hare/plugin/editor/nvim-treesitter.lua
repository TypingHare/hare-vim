-- Neovim tree-sitter configuration.
--
-- [https://github.com/nvim-treesitter/nvim-treesitter]
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  },
}
