---@class hare.buffer
---@field indent? hare.buffer.indent
---@field ruler? hare.buffer.ruler
---@field treesitter? table<string, any>
---@field lsp? table<string, any>
---@field linter? table<string, any>
---@field formatter? table<string, any>
---@field debugger? table<string, any>
---@field format_on_save? boolean
---
---@class hare.buffer.indent
---@field enabled? boolean
---@field width? number
---@field display_width? number
---@field shift_width? number
---
---@class hare.buffer.ruler
---@field enabled? boolean
---@field columns? number[]
---@field highlight? table<string, any>

---@class hare.lang
---@field filetypes string[]
---@field buffer_config hare.buffer

--- @type table<string, hare.lang>
local M = {
    lua = {
        filetypes = { 'lua' },
        buffer_config = {
            treesitter = { name = 'lua' },
            lsp = { name = 'lua_ls' },
            formatter = { name = 'stylua' },
        },
    },
    json = {
        filetypes = { 'json', 'jsonc' },
        buffer_config = {
            treesitter = { name = 'json' },
            lsp = { name = 'jsonls' },
            formatter = { name = 'prettier' },
            indent = { width = 2 },
            ruler = { enabled = false },
        },
    },
    toml = {
        filetypes = { 'toml' },
        buffer_config = {
            treesitter = { name = 'toml' },
            lsp = { name = 'taplo' },
            formatter = { name = 'taplo' },
            ruler = { enabled = false },
        },
    },
    yaml = {
        filetypes = { 'yaml' },
        buffer_config = {
            treesitter = { name = 'yaml' },
            lsp = { name = 'yamlls' },
            formatter = { name = 'prettier' },
            linter = { name = 'yamllint' },
            ruler = { enabled = false },
        },
    },
    bash = {
        filetypes = { 'sh', 'zsh' },
        buffer_config = {
            treesitter = { name = 'bash' },
            lsp = { name = 'bashls' },
            linter = { name = 'shellcheck' },
            formatter = { name = 'shfmt' },
        },
    },
    go = {
        filetypes = { 'go' },
        buffer_config = {
            treesitter = { name = 'go' },
            lsp = { name = 'gopls' },
            linter = { name = 'golangci-lint' },
            formatter = { name = 'gofumpt' },
        },
    },
    latex = {
        filetypes = { 'tex', 'bib' },
        buffer_config = {
            treesitter = { name = 'bibtex', highlight_enabled = false },
            lsp = { name = 'texlab' },
            formatter = { name = 'latexindent' },
            ruler = { enabled = false },
        },
    },
}

return M
