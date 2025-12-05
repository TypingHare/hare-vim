----------------------------------- Basic --------------------------------------

-- Clear research
vim.keymap.set(
  'n',
  '<Esc>',
  '<Esc>:nohlsearch<CR>',
  { desc = 'Exit Current Mode', silent = true }
)

-- Move the cursor to the next line (insert mode)
vim.keymap.set(
  'i',
  '<S-Enter>',
  '<ESC>o',
  { desc = 'Move to Next Line', silent = true }
)

-- Move the cursor to the next line (normal mode)
vim.keymap.set(
  'n',
  '<S-Enter>',
  'o<ESC>',
  { desc = 'Move to Next Line', silent = true }
)

----------------------------------- Coding -------------------------------------

vim.keymap.set(
  'n',
  '<leader>ce',
  ':e!<CR>',
  { desc = 'Refresh File', silent = true }
)

-- Format the current file
vim.keymap.set(
  'n',
  '<leader>cf',
  require('conform').format,
  { desc = 'Format File', silent = true }
)

-- Rename the identifier under the cursor
vim.keymap.set(
  'n',
  '<leader>cr',
  vim.lsp.buf.rename,
  { desc = 'Rename Identifier', silent = true }
)

-- Show diagnostics under the cursor
vim.keymap.set(
  'n',
  '<leader>cd',
  vim.diagnostic.open_float,
  { desc = 'Show Diagnostics', silent = true }
)

-- Go to the definition under the cursor
vim.keymap.set(
  'n',
  'gd',
  require('telescope.builtin').lsp_definitions,
  { desc = 'Go to Definition', silent = true }
)
