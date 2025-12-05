-- This plugin provides automatic line wrapping for Neovim.
--
-- [https://github.com/andrewferrier/wrapping.nvim]
return {
  'andrewferrier/wrapping.nvim',
  opts = {
    auto_set_mode_heuristically = true,
    notify_on_switch = false,
  },
  config = true,
}
