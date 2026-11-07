-- Offer PostgreSQL keywords even when the LSP has no schema suggestions.
vim.bo.omnifunc = "v:lua.require'hare.sql'.complete"
vim.b.omni_syntax_ignorecase = 1

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
