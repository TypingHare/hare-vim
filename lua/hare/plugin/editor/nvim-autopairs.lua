-- This plugin automatically inserts matching pairs of characters while you type
-- in insert mode.
--
-- [https://github.com/windwp/nvim-autopairs]
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
}
