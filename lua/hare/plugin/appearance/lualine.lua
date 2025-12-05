return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus

    -- Hide the statusline on the dashboard page
    -- Otherwise, set an empty statusline till Lualine loads
    if vim.fn.argc(-1) == 0 then
      vim.o.laststatus = 0
    else
      vim.o.statusline = ' '
    end
  end,
  opts = function()
    require 'lualine_require'

    -- Enable global statusline
    vim.o.laststatus = 3

    return {
      options = {
        theme = 'auto',
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = {
            'dashboard',
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'location' },
        lualine_z = {
          function()
            return '🕒 ' .. os.date '%H:%M'
          end,
        },
      },
    }
  end,
}
