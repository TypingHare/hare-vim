require('conform').setup {
    formatters_by_ft = {
        go = { 'golines', 'gofumpt' },
    },
    formatters = {
        golines = {
            command = 'golines',
            args = { '-m', '80' },
            stdin = true,
        },
    },
}

require('hare-conf').fn.set_buffer_config({ 'go' }, {
    ruler = {
        columns = { 80 },
    },
})
