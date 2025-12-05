-- This plugin is a lightweight, modern formatting plugin for Neovim.
--
-- [https://github.com/stevearc/conform.nvim]
return {
  'stevearc/conform.nvim',
  dependencies = { 'mason-org/mason.nvim' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
    },
  },
}
