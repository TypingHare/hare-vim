vim.lsp.config('ltex-ls-plus', {
    cmd = { 'ltex-ls-plus' },
    filetypes = {
        'markdown',
        'text',
        'tex',
        'plaintex',
        'latex',
    },
    settings = {
        ltex = {
            language = 'en-US',
            enabled = {
                'markdown',
                'text',
                'tex',
                'plaintex',
                'latex',
            },
            completionEnabled = true,
            checkFrequency = 'edit',
        },
    },
})

vim.lsp.enable 'ltex-ls-plus'
