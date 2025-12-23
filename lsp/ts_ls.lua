return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    settings = {
        implicitProjectConfiguration = {
            checkJs = true,
        },
    },
}
