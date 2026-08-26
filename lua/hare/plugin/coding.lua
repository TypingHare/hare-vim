return {
    -- This plugin brings tree-sitter-based parsing into the editor, enabling
    -- accurate, fast, and semantic understanding of source code.
    --
    -- [https://github.com/nvim-treesitter/nvim-treesitter]
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- This plugin adds syntax-aware text objects and motions to Neovim using
    -- Tree-sitter, so you can target structures like functions, classes,
    -- parameters, and loops.
    --
    -- [https://github.com/nvim-treesitter/nvim-treesitter-textobjects]
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        opts = {
            select = {
                lookahead = true,
                selection_modes = {
                    ['@function.outer'] = 'V',
                    ['@function.inner'] = 'V',
                },
            },
        },
        keys = {
            {
                'af',
                function()
                    local m = require 'nvim-treesitter-textobjects.select'
                    m.select_textobject('@function.outer', 'textobjects')
                end,
                mode = { 'x', 'o' },
                desc = 'Around function',
            },
            {
                'if',
                function()
                    local m = require 'nvim-treesitter-textobjects.select'
                    m.select_textobject('@function.inner', 'textobjects')
                end,
                mode = { 'x', 'o' },
                desc = 'Inside function',
            },
        },
    },
}
