local ok, lint = pcall(require, 'lint')
if not ok then
    return
end

-- TODO: move to hare-nvim
lint.linters_by_ft = {
    javascript = { 'eslint' },
    javascriptreact = { 'eslint' },
    typescript = { 'eslint' },
    typescriptreact = { 'eslint' },
}

vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function()
        require('lint').try_lint()
    end,
})
