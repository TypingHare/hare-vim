-- This plugin briefly highlights text after you yank it (copy it) in Vim/Neovim.
--
-- [https://github.com/machakann/vim-highlightedyank]
return {
  'machakann/vim-highlightedyank',
  event = 'TextYankPost',
  config = function()
    vim.g.highlightedyank_highlight_duration = 128
  end,
}
