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
            dap = { name = 'local-lua-debugger-vscode' },
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
            dap = { name = 'bash-debug-adapter' },
        },
    },
    make = {
        filetypes = { 'make' },
        buffer_config = {
            treesitter = { names = { 'make' } },
            lsp = { name = 'mbake' },
            linter = { name = 'checkmake' },
            formatter = {
                packages = {
                    { package_name = 'mbake', executable = 'bake' },
                },
            },
            indent = { type = 'tab', display_width = 4 },
        },
    },
    cmake = {
        filetypes = { 'cmake' },
        buffer_config = {
            treesitter = { names = { 'cmake' } },
            lsp = { name = 'cmake' },
            linter = { name = 'cmakelint' },
            ruler = { columns = { 80 } },
        },
    },
    markdown = {
        filetypes = { 'markdown' },
        buffer_config = {
            ruler = { enabled = false },
            treesitter = { names = { 'markdown' } },
            lsp = {},
            linter = {},
            formatter = {},
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
    go = {
        filetypes = { 'go' },
        buffer_config = {
            treesitter = { names = { 'go' } },
            lsp = { name = 'gopls' },
            linter = { name = 'golangci-lint' },
            formatter = { name = 'gofumpt' },
            dap = { name = 'delve' },
        },
    },
    python = {
        filetypes = { 'python' },
        buffer_config = {
            treesitter = { names = { 'python' } },
            lsp = { name = 'pyright' },
            dap = { name = 'debugpy' },
        },
    },
    java = {
        filetypes = { 'java' },
        buffer_config = {
            ruler = { columns = { 100 } },
            treesitter = { names = { 'java' } },
            lsp = { name = 'jdtls', enabled = false },
            formatter = { name = 'google-java-format' },
            dap = { name = 'java-debug-adapter' },
            format_on_save = false,
        },
    },
    kotlin = {
        filetypes = { 'kotlin', 'kt', 'kts' },
        buffer_config = {
            treesitter = { names = { 'kotlin' } },
            lsp = { name = 'kotlin_language_server' },
            linter = { name = 'ktlint' },
            formatter = { name = 'ktlint' },
            ruler = { columns = { 100 } },
            dap = { name = 'kotlin-debug-adapter' },
        },
    },
    javascript = {
        filetypes = {
            'javascript',
            'javascriptreact',
        },
        buffer_config = {
            treesitter = {
                names = {
                    'javascript',
                },
            },
            lsp = { name = 'ts_ls' },
            formatter = { name = 'prettier' },
            linter = { name = 'eslint-lsp' },
            dap = { name = 'js-debug-adapter' },
        },
    },
    typescript = {
        filetypes = {
            'typescript',
            'typescriptreact',
        },
        buffer_config = {
            treesitter = {
                names = {
                    'typescript',
                    'tsx',
                },
            },
            lsp = { name = 'ts_ls' },
            formatter = { name = 'prettier' },
            linter = { name = 'eslint-lsp' },
            dap = { name = 'js-debug-adapter' },
        },
    },
    css = {
        filetypes = { 'css', 'scss', 'less' },
        buffer_config = {
            treesitter = { names = { 'css' } },
            lsp = { name = 'cssls' },
            formatter = { name = 'prettier' },
            indent = { width = 2 },
        },
    },
    html = {
        filetypes = { 'html' },
        buffer_config = {
            treesitter = { names = { 'html' } },
            lsp = { name = 'html' },
            formatter = { name = 'prettier' },
            indent = { width = 2 },
        },
    },
    c = {
        filetypes = { 'c', 'h' },
        buffer_config = {
            indent = {
                type = 'tab',
                width = 8,
                display_width = 8,
                shift_width = 8,
            },
            treesitter = { names = { 'c' } },
            lsp = { name = 'clangd' },
            formatter = { name = 'clang-format' },
            ruler = { columns = { 80 } },
            dap = { name = 'codelldb' },
        },
    },
    cpp = {
        filetypes = { 'c', 'cpp', 'h', 'hpp' },
        buffer_config = {
            treesitter = { names = { 'cpp' } },
            formatter = { name = 'clang-format' },
            lsp = { name = 'clangd' },
            ruler = { columns = { 80 } },
            dap = { name = 'codelldb' },
        },
    },
    sql = {
        filetypes = { 'sql' },
        buffer_config = {
            treesitter = { names = { 'sql' } },
            lsp = { name = 'sqls' },
            formatter = { name = 'sqruff' },
        },
    },
    svelte = {
        filetypes = { 'svelte' },
        buffer_config = {
            treesitter = { names = { 'svelte' } },
            lsp = { name = 'svelte' },
            formatter = { name = 'prettier' },
            indent = { width = 2 },
            dap = { name = 'js-debug-adapter' },
        },
    },
    systemd = {
        filetypes = { 'systemd' },
        buffer_config = {
            ruler = { enabled = false },
            treesitter = { enabled = false },
            lsp = { name = 'systemd_lsp' },
            linter = { name = 'systemdlint' },
        },
    },
}

return M
