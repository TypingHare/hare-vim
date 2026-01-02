require('conform').setup {
    formatters_by_ft = {
        go = { 'golines', 'gofumpt' },
        formatters = {
            golines = {
                command = 'golines',
                args = { '-m', '100' },
                stdin = true,
            },
        },
    },
}
