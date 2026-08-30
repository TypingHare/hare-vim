return {
    -- This plugin is a tool installer and manager for Neovim. It installs and
    -- manages external developer tools (like LSP servers, formatters, and
    -- linters) in a standard, editor-local way, without relying on your system
    -- package manager.
    --
    -- [https://github.com/mason-org/mason.nvim]
    {
        'mason-org/mason.nvim',
        config = true,
    },

    -- This plugin provides ready-made configurations to connect Neovim's
    -- built-in LSP client to language servers.
    --
    -- [https://github.com/neovim/nvim-lspconfig]
    {
        'neovim/nvim-lspconfig',
    },

    -- This plugin is the bridge between tool installation and LSP configuration
    -- in Neovim. It connects mason.nvim (which installs LSP servers) with
    -- nvim-lspconfig (which configures and starts them).
    --
    -- [https://github.com/mason-org/mason-lspconfig.nvim]
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
    },

    -- This plugin is a code formatting plugin for Neovim. It runs external
    -- formatters (such as Stylua, Prettier, gofmt, etc.) and applies their
    -- output to your buffer.
    --
    -- It formats code using real formatter tools instead of LSP formatting. It
    -- also runs formatting asynchronously without UI freezing.
    --
    -- [https://github.com/stevearc/conform.nvim]
    {
        'stevearc/conform.nvim',
        dependencies = { 'mason-org/mason.nvim' },
    },

    -- This plugin is a tool that installs Mason packages.
    --
    -- [https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim]
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    -- This plugin is a performance extension for Telescope that replaces
    -- Lua-based fuzzy sorting with a native (C) implementation of the fzf
    -- algorithm, making searches dramatically faster.
    --
    -- [https://github.com/nvim-telescope/telescope-fzf-native.nvim]
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- This plugin is a file explorer implemented as a Telescope picker. It lets
    -- you browse, create, rename, delete, and open files using Telescope's
    -- fuzzy-search UI.
    --
    -- [https://github.com/nvim-telescope/telescope-file-browser.nvim]
    {
        'nvim-telescope/telescope-file-browser.nvim',
    },

    -- This plugin is a highly extensible fuzzy finder and picker framework for
    -- Neovim. It provides a unified UI for searching, filtering, previewing,
    -- and acting on many kinds of data inside your editor.
    --
    -- [https://github.com/nvim-telescope/telescope.nvim]
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
    },

    -- This plugin allows you to use lazygit in Neovim.
    --
    -- See: https://github.com/jesseduffield/lazygit
    --
    -- [https://github.com/kdheepak/lazygit.nvim]
    {
        'kdheepak/lazygit.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        cmd = { 'LazyGit' },
    },
}
