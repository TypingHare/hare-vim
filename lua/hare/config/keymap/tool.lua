-- Show the checkhealth panel
vim.keymap.set(
  'n',
  '<leader>mh',
  ':checkhealth<CR>',
  { desc = 'Check Health', silent = true }
)

-- Show the Lazy panel
vim.keymap.set('n', '<leader>ml', ':Lazy<CR>', { desc = 'Lazy', silent = true })

-- Show LSP information
vim.keymap.set(
  'n',
  '<leader>mL',
  ':LspInfo<CR>',
  { desc = 'LSP Info', silent = true }
)

-- Show the Mason panel
vim.keymap.set(
  'n',
  '<leader>mm',
  ':Mason<CR>',
  { desc = 'Mason', silent = true }
)

-- Show Startup Time
vim.keymap.set(
  'n',
  '<leader>mS',
  ':StartupTime<CR>',
  { desc = 'Startup Time', silent = true }
)

-- Show Noice history
vim.keymap.set(
  'n',
  '<leader>h',
  ':Notifications<CR>',
  { desc = 'Notification History', silent = true }
)
