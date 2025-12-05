return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      float_opts = {
        border = 'curved',
        width = function()
          return math.floor(vim.o.columns * 0.6)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.6)
        end,
      },
    }
  end,
}
