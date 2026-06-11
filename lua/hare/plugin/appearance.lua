return {
    -- This plugin is a Lua utility library for Neovim plugin development. It
    -- provides a large set of helper APIs and abstractions that make writing
    -- other plugins easier, cleaner, and more reliable.
    --
    -- [https://github.com/nvim-lua/plenary.nvim]
    {
        'nvim-lua/plenary.nvim',
    },

    -- This plugin is a UI component framework for Neovim plugins. It provides
    -- a high-level building blocks (popups, layouts, menus, inputs, trees) for
    -- creating rich, interactive Neovim interfaces using Lua.
    --
    -- [https://github.com/MunifTanjim/nui.nvim]
    {
        'MunifTanjim/nui.nvim',
    },

    -- This plugin registers a set of icons keyed by filename and filetype.
    --
    -- [https://github.com/nvim-tree/nvim-web-devicons]
    {
        'nvim-tree/nvim-web-devicons',
    },

    -- This plugin provides a modern file explorer sidebar for Neovim. It
    -- provides a tree-style view of your project (files, folders, git status,
    -- buffers) with a polished UI and deep integrations.
    --
    -- [https://github.com/nvim-neo-tree/neo-tree.nvim]
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        event = 'VeryLazy',
        opts = {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    show_hidden_count = false,
                    always_show = { '.gitignore', '.gitkeep' },
                },
            },
            window = {
                ---@type table<string, boolean | string | any>
                mappings = {
                    ['<cr>'] = {
                        function(state)
                            state.commands.open(state)
                            require('neo-tree.command').execute {
                                action = 'close',
                            }
                        end,
                        desc = 'Open File & Close Neotree',
                    },
                    ['h'] = { 'close_node', desc = 'Close Directory' },
                    ['l'] = { 'open', desc = 'Open File/Directory' },
                    ['e'] = {
                        function()
                            vim.cmd 'wincmd l'
                        end,
                        desc = 'Move Focus to Editor',
                    },
                    ['O'] = {
                        function(state)
                            local path = state.tree:get_node():get_id()
                            vim.fn.jobstart { 'open', path }
                        end,
                        desc = 'Open with OS',
                    },
                },
            },
        },
    },

    -- This plugin adds a visual buffer tab bar (a buffer line) to Neovim. It
    -- shows open buffers as clickable, styled tabs. It also makes switching
    -- between buffers fast and visual.
    --
    -- [https://github.com/akinsho/bufferline.nvim]
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-neo-tree/neo-tree.nvim',
        },
        opts = {
            options = {
                mode = 'buffers',
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, _, _)
                    local icon = level:match 'error' and ' ' or ' '
                    return ' ' .. icon .. count
                end,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = '[Neo-tree]',
                        highlight = 'Directory',
                        text_align = 'left',
                        separator = false,
                    },
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },

    -- This plugin replaces Vim's default statusline with a modern, extensible
    -- one that shows useful editor and project information at a glance.
    --
    -- [https://github.com/nvim-lualine/lualine.nvim]
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.statusline = ' '
        end,
        opts = {
            options = {
                theme = 'auto',
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                lualine_y = { 'location' },
                lualine_z = {
                    function()
                        return os.date '%b %d | %H:%M'
                    end,
                },
            },
        },
    },
}
