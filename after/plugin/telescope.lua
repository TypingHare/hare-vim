-- Show references of identifier under cursor
vim.keymap.set('n', 'grr', function()
    require('telescope.builtin').lsp_references()
end, { desc = 'LSP references (Telescope)', noremap = true, silent = true })
