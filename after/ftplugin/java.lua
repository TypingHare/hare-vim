local group = vim.api.nvim_create_augroup('JavaSpotless', { clear = false })

vim.api.nvim_clear_autocmds { group = group, buffer = 0 }

vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    buffer = 0,
    callback = function(args)
        vim.lsp.buf.format { name = 'jdtls', bufnr = args.buf, async = false }
    end,
})
