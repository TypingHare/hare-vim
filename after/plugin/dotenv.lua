vim.filetype.add {
    pattern = {
        ['%.env'] = 'dotenv',
        ['%.env%..*'] = 'dotenv',
    },
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'dotenv',
    callback = function()
        vim.treesitter.start(0, 'ini')
    end,
})
