return {
    'ray-x/go.nvim',
    dependencies = {
        'ray-x/guihua.lua',
        'neovim/nvim-lspconfig',
    },
    config = function()
        require('go').setup {
            lsp_inlay_hints = {
                enable = false,
            },
        }

        local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', { clear = true })

        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*.go',
            callback = function()
                require('go.format').goimports()
            end,
            group = format_sync_grp,
        })
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
}
