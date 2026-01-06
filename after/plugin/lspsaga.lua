local ok, _ = pcall(require, 'lspsaga')
if not ok then
    return
end

-- Show a floating terminal window.
vim.keymap.set(
    'n',
    '<leader>tf',
    ':Lspsaga term_toggle<CR>',
    { noremap = true, silent = true, desc = 'Float Terminal' }
)

-- Show hover documentation.
vim.keymap.set(
    'n',
    '<leader><Cr>',
    ':Lspsaga code_action<CR>',
    { noremap = true, silent = true, desc = 'Code Action' }
)

-- Show diagnostics under the cursor.
vim.keymap.set(
    'n',
    '<leader>cd',
    ':Lspsaga diagnostic_jump_next<CR>',
    { noremap = true, silent = true, desc = 'Show Diagnostics' }
)
