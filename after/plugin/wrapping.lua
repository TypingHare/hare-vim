vim.api.nvim_create_autocmd('User', {
    pattern = 'WrappingSet',
    callback = function(args)
        if args.data.mode == 'soft' then
            vim.keymap.set('n', 'j', 'gj', {
                buffer = args.data.buf,
            })
            vim.keymap.set('n', 'k', 'gk', {
                buffer = args.data.buf,
            })
        else
            vim.keymap.del('n', 'j', {
                buffer = args.data.buf,
            })
            vim.keymap.del('n', 'k', {
                buffer = args.data.buf,
            })
        end
    end,
})
