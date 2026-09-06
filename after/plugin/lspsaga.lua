if not pcall(require, 'lspsaga') then
    return
end

-- Show a floating terminal window.
vim.keymap.set(
    'n',
    '<leader>tf',
    ':Lspsaga term_toggle<CR>',
    { silent = true, desc = 'Float Terminal' }
)

-- Show hover documentation.
vim.keymap.set(
    'n',
    '<leader><Cr>',
    ':Lspsaga code_action<CR>',
    { silent = true, desc = 'Code Action' }
)

-- Show diagnostics under the cursor.
vim.keymap.set(
    'n',
    '<leader>cd',
    ':Lspsaga show_line_diagnostics<CR>',
    { silent = true, desc = 'Show Diagnostics' }
)

-- Show diagnostics for the next position.
vim.keymap.set(
    'n',
    '<leader>cd',
    ':Lspsaga diagnostic_jump_next<CR>',
    { silent = true, desc = 'Show Next Diagnostics' }
)
