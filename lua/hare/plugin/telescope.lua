return {
    -- This plugin is a performance extension for Telescope that replaces Lua-based fuzzy sorting
    -- with a native (C) implementation of the fzf algorithm, making searches dramatically faster.
    --
    -- [https://github.com/nvim-telescope/telescope-fzf-native.nvim]
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- This plugin is a file explorer implemented as a Telescope picker. It lets you browse,
    -- create, rename, delete, and open files using Telescope's fuzzy-search UI.
    --
    -- [https://github.com/nvim-telescope/telescope-file-browser.nvim]
    {
        'nvim-telescope/telescope-file-browser.nvim',
    },

    -- This plugin is a highly extensible fuzzy finder and picker framework for Neovim. It provides
    -- a unified UI for searching, filtering, previewing, and acting on many kinds of data inside
    -- your editor.
    --
    -- [https://github.com/nvim-telescope/telescope.nvim]
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        opts = {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    prompt_position = 'top',
                    preview_width = 0.6,
                },
                sorting_strategy = 'ascending',
                scroll_strategy = 'cycle',
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                oldfiles = {
                    hidden = true,
                    sorter = require('telescope.sorters').get_substr_matcher(),
                },
            },
        },
    },
}
