return {
    {
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
        end,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod' },
        build = ':lua require("go.install").update_all_sync()',
    },
}
