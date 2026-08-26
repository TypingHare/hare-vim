local ok, conform = pcall(require, 'conform')
if not ok then
    return
end

conform.setup {
    formatters = {
        sqruff = {
            command = 'sqruff',
            args = { 'fix', '-' },
            stdin = true,
        },
    },
}
