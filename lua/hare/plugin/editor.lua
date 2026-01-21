return {
    -- This plugin is a modern autocompletion engine for Neovim. It provides a fast, minimal, and
    -- predictable code completion. More specifically, it shows completion suggestions as you type,
    -- inserts and confirms completion intelligently, and integrates with LSP, snippets, paths,
    -- buffers, etc.
    --
    -- It serves the same role as nvim-cmp, but it is faster, lower latency, and cleaner behavior.
    --
    -- [https://github.com/saghen/blink.cmp]
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        build = 'cargo +nightly build --release',
        opts = {
            keymap = {
                preset = 'default',
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },
            fuzzy = { implementation = 'prefer_rust' },
            sources = {
                default = { 'lsp', 'path', 'lazydev' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                },
            },
        },
        opts_extend = { 'sources.default' },
    },

    -- This plugin automatically generates annotations and documentation comments for your code, so
    -- that you can write doc-comments quickly and consistently without doing the boilerplate
    -- yourself.
    --
    -- [https://github.com/danymat/neogen]
    {
        'danymat/neogen',
        config = true,
    },

    -- This plugin visually shows indentation levels in Neovim by drawing vertical guide lines (or
    -- other markers) for each indent level.
    --
    -- [https://github.com/lukas-reineke/indent-blankline.nvim]
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
                tab_char = '▏',
            },
            scope = { enabled = false },
        },
        config = true,
    },

    -- This plugin automatically inserts matching pairs of characters while you type in Neovim.
    --
    -- When you type an opening character, it inserts the closing one and then places your cursor
    -- inside the pair. It also handles deletion, skipping, and wrapping intelligently.
    --
    -- [https://github.com/windwp/nvim-autopairs]
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },

    -- This plugin shows Git change indicator directly in the editor gutter (sign column) and
    -- provides fast, buffer-local Git actions like hunk navigation, staging, blaming, and
    -- previews.
    --
    -- [https://github.com/lewis6991/gitsigns.nvim]
    {

        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            signs_staged = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            signs_staged_enable = true,
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 25,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '    <author>, <author_time:%R>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 32768,
            preview_config = {
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
        },
        config = true,
    },

    -- This plugin highlights matching delimiters (parentheses, brackets, braces, etc.) in different
    -- colors, making nested code structures much easier to read.
    --
    -- [https://github.com/HiPhish/rainbow-delimiters.nvim]
    {
        'HiPhish/rainbow-delimiters.nvim',
    },

    -- This plugin shows a colorcolumn (ruler) only when it’s needed, instead of having it always
    -- on.
    --
    -- [https://github.com/m4xshen/smartcolumn.nvim]
    {
        'm4xshen/smartcolumn.nvim',
        config = true,
    },

    -- This plugin is a UI enhancement layer for Neovim’s built-in LSP.
    --
    -- [https://github.com/nvimdev/lspsaga.nvim]
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            lightbulb = {
                enable = false,
            },
            symbol_in_winbar = {
                enable = false,
            },
        },
        config = true,
    },

    -- This plugin makes moving around in your code extremely fast by letting you jump to any
    -- visible location with a few keystrokes.
    --
    -- [https://github.com/folke/flash.nvim]
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
    },

    -- This plugin highlights and searches for todo comments like `TODO`, `HACK`, `BUG` in your
    -- codebase.
    --
    -- [https://github.com/folke/todo-comments.nvim]
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- This plugin shows non-intrusive loading indicators (spinners) for LSP operations in Neovim.
    --
    -- [https://github.com/j-hui/fidget.nvim]
    {
        'j-hui/fidget.nvim',
    },
}
