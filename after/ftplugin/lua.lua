-- Important setup for lazydev.nvim to work in newer versions
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                pathStrict = false,
                version = 'LuaJIT',
            },
        },
    },
})
