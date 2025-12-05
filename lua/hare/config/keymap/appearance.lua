--------------------------------- Bufferline -----------------------------------

-- Move to the next buffer in cycles
vim.keymap.set(
  'n',
  '<Tab>',
  ':BufferLineCycleNext<CR>',
  { desc = 'Next Buffer', silent = true }
)

-- Move to the previous buffer in cycles
vim.keymap.set(
  'n',
  '<S-Tab>',
  ':BufferLineCyclePrev<CR>',
  { desc = 'Previous Buffer', silent = true }
)

-- Save all files and close all other buffers
vim.keymap.set('n', '<leader>bo', function()
  vim.cmd 'wa'
  vim.cmd 'BufferLineCloseOthers'
end, { desc = 'Close Other Buffers', silent = true })

-- Save all buffers
vim.keymap.set(
  'n',
  '<leader>bs',
  ':wa<CR>',
  { desc = 'Save All Buffers', silent = true }
)

-- Save and close the current buffer
vim.keymap.set('n', '<leader>bd', function()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)
  local is_modifiable = vim.bo.modifiable
  local is_readonly = vim.bo.readonly

  if name ~= '' and is_modifiable and not is_readonly then
    vim.cmd 'write!'
  end

  require('bufferline.commands').cycle(-1)
  vim.cmd('bdelete! ' .. buf)
end, { desc = 'Close Buffer', silent = true })

--------------------------------- Find Files -----------------------------------

vim.keymap.set(
  'n',
  '<leader>ff',
  ':Telescope find_files<CR>',
  { desc = 'Find Files', silent = true }
)

vim.keymap.set(
  'n',
  '<leader>fb',
  ':Telescope buffers<CR>',
  { desc = 'Find Buffers', silent = true }
)

vim.keymap.set('n', '<leader>fo', function()
  require('telescope.builtin').oldfiles { cwd_only = true }
end, { desc = 'Find Old Files', silent = true })

vim.keymap.set('n', '<leader>ft', function()
  local telescope = require 'telescope.builtin'
  local ext = vim.fn.expand '%:e'

  telescope.find_files {
    find_command = { 'fd', '--type', 'f', '--extension', ext },
    prompt_title = 'Files with extension: ' .. ext,
  }
end, { desc = 'Find Same Type', silent = true })

vim.keymap.set(
  'n',
  '<leader>fg',
  ':Telescope live_grep<CR>',
  { desc = 'Live Grep', silent = true }
)

---------------------------------- Terminal ------------------------------------

-- Open a terminal buffer
vim.keymap.set(
  'n',
  '<leader>tt',
  ':terminal<CR>',
  { desc = 'Open Terminal', silent = true }
)

-- If the terminal buffer is not lazygit, then <Esc> can bring the user back to
-- the normal mode
vim.keymap.set('t', '<Esc>', function()
  local ft = vim.bo.filetype
  if ft ~= 'lazygit' then
    vim.cmd 'stopinsert'
  end
end, { silent = true })

-- Open toggle terminal (direction = float)
vim.keymap.set('n', '<leader>tf', function()
  local Terminal = require('toggleterm.terminal').Terminal
  local term = Terminal:new {
    direction = 'float',
    cwd = vim.fn.getcwd(),
    hidden = true,
    start_in_insert = true,
    close_on_exit = true,
  }

  term:spawn()
  term:toggle()
end, { desc = 'Open Terminal (float)', silent = true })
