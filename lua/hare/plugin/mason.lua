return {
    -- This plugin is a tool installer and manager for Neovim. It installs and manages external
    -- developer tools (like LSP servers, formatters, and linters) in a standard, editor-local way,
    -- without relying on your system package manager.
    --
    -- [https://github.com/mason-org/mason.nvim]
    {
        'mason-org/mason.nvim',
        config = true,
    },

    -- This plugin provides ready-made configurations to connect Neovim's built-in LSP client to
    -- language servers.
    --
    -- [https://github.com/neovim/nvim-lspconfig]
    {
        'neovim/nvim-lspconfig',
    },

    -- This plugin is the bridge between tool installation and LSP configuration in Neovim. It
    -- connects mason.nvim (which installs LSP servers) with nvim-lspconfig (which configures and
    -- starts them).
    --
    -- [https://github.com/mason-org/mason-lspconfig.nvim]
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
    },

    -- This plugin is a code formatting plugin for Neovim. It runs external formatters (such as
    -- Stylua, Prettier, gofmt, etc.) and applies their output to your buffer.
    --
    -- It formats code using real formatter tools instead of LSP formatting. It also runs formatting
    -- asynchronously without UI freezing.
    --
    -- [https://github.com/stevearc/conform.nvim]
    {
        'stevearc/conform.nvim',
        dependencies = { 'mason-org/mason.nvim' },
        opts = {
            format_on_save = {
                timeout_ms = 5000,
            },
        },
    },

    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
}
