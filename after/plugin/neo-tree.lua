local ok, _ = pcall(require, 'neo-tree')
if not ok then
    return
end

vim.keymap.set('n', '<leader>n', ':Neotree<CR>', { desc = 'Open Neotree', silent = true })
