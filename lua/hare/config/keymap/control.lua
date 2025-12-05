-- Save all and quit Neovim
vim.keymap.set(
  'n',
  '<leader>qa',
  ':wa<CR>:qa<CR>',
  { desc = 'Save All & Quit', silent = true }
)

-- Forcibly quit Neovim without saving
vim.keymap.set('n', '<leader>qf', ':qa!<CR>', { desc = 'Quit', silent = true })

----------------------------------- Window -------------------------------------

-- Control window
vim.keymap.set('n', '<leader>w', '<C-W>', { desc = 'Window', silent = true })

vim.keymap.set('n', '<C-h>', '<C-W>h', {
  desc = 'Move focus to left window',
  silent = true,
})

vim.keymap.set('n', '<C-j>', '<C-W>j', {
  desc = 'Move focus to lower window',
  silent = true,
})

vim.keymap.set('n', '<C-k>', '<C-W>k', {
  desc = 'Move focus to upper window',
  silent = true,
})

vim.keymap.set('n', '<C-l>', '<C-W>l', {
  desc = 'Move focus to right window',
  silent = true,
})
