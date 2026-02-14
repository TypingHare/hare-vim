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
            checkFrequency = 'save',
            disabledRules = {
                ['en-US'] = {
                    'MORFOLOGIK_RULE_EN_US',
                    'ENGLISH_WORD_REPEAT_BEGINNING_RULE',
                },
            },
        },
    },
})

vim.lsp.enable 'ltex-ls-plus'
