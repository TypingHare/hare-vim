return {
    -- This plugin provides a search and replace panel for Neovim.
    --
    -- [https://github.com/nvim-pack/nvim-spectre]
    {
        'nvim-pack/nvim-spectre',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = 'Spectre',
    },

    -- This is an asynchronous linter plugin for Neovim complementary to the
    -- built-in Language Server Protocol support.
    --
    -- [https://github.com/mfussenegger/nvim-lint]
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- This plugin provides a collection of icons for Neovim.
    --
    -- [https://github.com/nvim-mini/mini.icons]
    {
        'nvim-mini/mini.icons',
    },

    -- This plugin provides a pictogram for Neovim's built-in LSP. It shows
    -- [https://github.com/onsails/lspkind.nvim]
    {
        'onsails/lspkind.nvim',
    },

    -- This plugin is a modern autocompletion engine for Neovim. It provides a
    -- fast, minimal, and predictable code completion. More specifically, it
    -- shows completion suggestions as you type, inserts and confirms completion
    -- intelligently, and integrates with LSP, snippets, paths, buffers, etc.
    --
    -- It serves the same role as nvim-cmp, but it is faster, lower latency, and
    -- cleaner behavior.
    --
    -- [https://github.com/saghen/blink.cmp]
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'nvim-mini/mini.icons',
        },
        version = '1.*',
        build = 'cargo +nightly build --release',
        opts = function()
            local opts = {
                completion = { menu = { draw = { columns = {} } } },
            }
            opts.completion.menu.draw.auto_show = true
            opts.completion.menu.draw.columns = {

                {
                    'kind_icon',
                    'label',
                    'label_description',
                    gap = 1,
                },
                { 'kind' },
            }
            opts.completion.menu.draw.components = {
                kind_icon = {
                    ellipsis = false,
                    text = function(ctx)
                        return require('lspkind').symbol_map[ctx.kind] or ''
                    end,
                    highlight = function(ctx)
                        local _, hl, _ =
                            require('mini.icons').get('lsp', ctx.kind)
                        return hl
                    end,
                },
                kind = {
                    highlight = function(ctx)
                        local _, hl, _ =
                            require('mini.icons').get('lsp', ctx.kind)
                        return hl
                    end,
                },
            }
            opts.completion.documentation = {
                window = { border = 'single' },
                auto_show = true,
                auto_show_delay_ms = 100,
            }
            opts.keymap = {
                preset = 'default',
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            }
            opts.fuzzy = { implementation = 'prefer_rust' }
            opts.sources = {
                default = { 'lsp', 'path' },
                providers = {},
            }

            if require('lazy.core.config').plugins['lazydev.nvim'] then
                table.insert(opts.sources.default, 'lazydev')
                opts.sources.providers.lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                }
            end

            return opts
        end,
        opts_extend = { 'sources.default' },
    },

    -- This plugin automatically generates annotations and documentation
    -- comments for your code, so that you can write doc-comments quickly and
    -- consistently without doing the boilerplate yourself.
    --
    -- [https://github.com/danymat/neogen]
    {
        'danymat/neogen',
        config = true,
    },

    -- This plugin visually shows indentation levels in Neovim by drawing
    -- vertical guide lines (or other markers) for each indent level.
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

    -- This plugin automatically inserts matching pairs of characters while you
    -- type in Neovim.
    --
    -- When you type an opening character, it inserts the closing one and then
    -- places your cursor inside the pair. It also handles deletion, skipping,
    -- and wrapping intelligently.
    --
    -- [https://github.com/windwp/nvim-autopairs]
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },

    -- This plugin shows Git change indicator directly in the editor gutter
    -- (sign column) and provides fast, buffer-local Git actions like hunk
    -- navigation, staging, blaming, and previews.
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
        },
        config = true,
    },

    -- This plugin highlights matching delimiters (parentheses, brackets,
    -- braces, etc.) in different colors, making nested code structures much
    -- easier to read.
    --
    -- [https://github.com/HiPhish/rainbow-delimiters.nvim]
    {
        'HiPhish/rainbow-delimiters.nvim',
    },

    -- This plugin shows a colorcolumn (ruler) only when it’s needed, instead of
    -- having it always on.
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

    -- This plugin makes moving around in your code extremely fast by letting
    -- you jump to any visible location with a few keystrokes.
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

    -- This plugin highlights and searches for todo comments like `TODO`,
    -- `HACK`, `BUG` in your codebase.
    --
    -- [https://github.com/folke/todo-comments.nvim]
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true,
    },

    -- This plugin shows non-intrusive loading indicators (spinners) for LSP
    -- operations in Neovim.
    --
    -- [https://github.com/j-hui/fidget.nvim]
    {
        'j-hui/fidget.nvim',
        config = true,
    },
}
