if not pcall(require, 'neo-tree') then
    return
end

-- Open the Neo-tree window.
vim.keymap.set(
    'n',
    '<leader>n',
    ':Neotree<CR>',
    { desc = 'Open Neotree', silent = true }
)
