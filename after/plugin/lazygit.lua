local ok, _ = pcall(require, 'lazygit')
if not ok then
    return
end

vim.api.nvim_create_autocmd('TermClose', {
    pattern = '*',
    callback = function()
        -- Refresh Neotree
        require('neo-tree.sources.filesystem.commands').refresh(
            require('neo-tree.sources.manager').get_state 'filesystem'
        )
    end,
})

vim.keymap.set('n', '<leader>gl', ':LazyGit<CR>', { desc = 'Open Lazygit', silent = true })
