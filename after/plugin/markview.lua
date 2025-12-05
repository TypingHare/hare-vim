vim.api.nvim_create_autocmd('FileType', {
  pattern = '*markdown*',
  callback = function(args)
    vim.schedule(function()
      vim.cmd 'Markview Disable'
    end)

    local buf = args.buf
    vim.keymap.set(
      'n',
      '<leader>em',
      '<cmd>Markview Toggle<CR>',
      { buffer = buf, desc = 'Toggle MarkView' }
    )
  end,
})
