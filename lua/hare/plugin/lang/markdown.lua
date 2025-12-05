return {
  {
    'OXY2DEV/markview.nvim',
    dependencies = {
      'saghen/blink.cmp',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      experimental = { check_rtp = false },
      preview = {
        ignore_buftypes = {},
      },
    },
    config = function()
      require('markview').setup {
        preview = {
          ignore_buftypes = {},
          filetypes = { 'markdown', 'md' },
        },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*markdown*',
        callback = function(args)
          local buf = args.buf
          vim.keymap.set(
            'n',
            '<leader>em',
            '<cmd>Markview Toggle<CR>',
            { buffer = buf, desc = 'Toggle MarkView' }
          )
        end,
      })
    end,
  },
}
