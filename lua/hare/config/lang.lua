-- This module returns a table of language configurations. For each entry in
-- this table, the key is a string representing the language name, and the value
-- is a table containing two fields: `filetypes` and `buffer_config`. The
-- `filetypes` field is a list of strings representing the filetypes associated
-- with the language, and the `buffer_config` field is a table containing
-- configuration options for the buffer.
--
--- @type table<string, hare.lang>
local M = {
    lua = {
        filetypes = { 'lua' },
        buffer_config = {
            treesitter = { names = { 'lua' } },
            lsp = { name = 'lua_ls' },
            formatter = { name = 'stylua' },
        },
    },
    json = {
        filetypes = { 'json', 'jsonc' },
        buffer_config = {
            treesitter = { names = { 'json' } },
            lsp = { name = 'jsonls' },
            formatter = { name = 'prettier' },
            indent = { width = 2 },
            ruler = { enabled = false },
        },
    },
    toml = {
        filetypes = { 'toml' },
        buffer_config = {
            treesitter = { names = { 'toml' } },
            lsp = { name = 'taplo' },
            formatter = { name = 'taplo' },
            ruler = { enabled = false },
        },
    },
    yaml = {
        filetypes = { 'yaml' },
        buffer_config = {
            treesitter = { names = { 'yaml' } },
            lsp = { name = 'yamlls' },
            formatter = { name = 'prettier' },
            linter = { name = 'yamllint' },
            ruler = { enabled = false },
        },
    },
    bash = {
        filetypes = { 'sh', 'zsh' },
        buffer_config = {
            treesitter = { names = { 'bash' } },
            lsp = { name = 'bashls' },
            linter = { name = 'shellcheck' },
            formatter = { name = 'shfmt' },
        },
    },
    go = {
        filetypes = { 'go' },
        buffer_config = {
            treesitter = { names = { 'go' } },
            lsp = { name = 'gopls' },
            linter = { name = 'golangci-lint' },
            formatter = { name = 'gofumpt' },
        },
    },
    latex = {
        filetypes = { 'tex', 'bib' },
        buffer_config = {
            treesitter = { names = { 'bibtex' }, highlight_enabled = false },
            lsp = { name = 'texlab' },
            formatter = { name = 'latexindent' },
            ruler = { enabled = false },
        },
    },
}

return M
