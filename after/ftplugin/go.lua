local ok, conform = pcall(require, 'conform')
if not ok then
    return
end

conform.setup {
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
