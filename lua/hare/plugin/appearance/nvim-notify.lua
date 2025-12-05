return {
  'rcarriga/nvim-notify',
  lazy = false,
  config = function()
    local notify = require 'notify'
    ---@diagnostic disable-next-line: missing-fields
    notify.setup {
      stages = 'slide',
      timeout = 2000,
    }

    vim.notify = notify
  end,
}
