local ok, _ = pcall(require, 'markview')
if not ok then
    return
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*markdown*',
    callback = function(args)
        local buf = args.buf
        vim.keymap.set(
            'n',
            '<leader>em',
            '<cmd>Markview Toggle<CR>',
            { buffer = buf, desc = 'Toggle MarkView' }
        )
    end,
})
