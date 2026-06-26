local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    return
end

vim.keymap.set('n', '<leader>gb', function()
    gitsigns.toggle_current_line_blame()
end, { desc = 'Toggle Git Blame' })
