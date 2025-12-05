return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-neo-tree/neo-tree.nvim',
  },
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'ordinal',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
          separator = false,
        },
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
    -- highlights = {
    --   buffer_selected = {
    --     fg = '#e9ecef',
    --     bold = true,
    --     italic = false,
    --   },
    -- },
  },
}
