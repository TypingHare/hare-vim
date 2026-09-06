local ok, spectre = pcall(require, 'spectre')
if not ok then
    return
end

vim.keymap.set('n', '<leader>S', spectre.toggle, {
    desc = 'Spectre: toggle',
    silent = true,
})

vim.keymap.set('n', '<leader>sw', function()
    spectre.open_visual { select_word = true }
end, {
    desc = 'Spectre: search current word',
    silent = true,
})

vim.keymap.set('v', '<leader>sw', function()
    spectre.open_visual()
end, {
    desc = 'Spectre: search selection',
    silent = true,
})

vim.keymap.set('n', '<leader>sp', function()
    spectre.open_file_search { select_word = true }
end, {
    desc = 'Spectre: search in current file',
    silent = true,
})
