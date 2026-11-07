return {
    {
        url = 'https://codeberg.org/lifepillar/pgsql.vim.git',
        lazy = false,
        init = function()
            -- PostgreSQL syntax handles identity columns and other dialect
            -- features.
            vim.g.sql_type_default = 'pgsql'
        end,
        config = function()
            vim.lsp.config('sqls', {
                root_markers = { 'pom.xml', '.git' },
            })
        end,
    },
}
