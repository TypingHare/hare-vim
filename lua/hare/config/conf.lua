-- The main configuration for HareVim.
local M = {
    appearance = {
        cursor = {
            normal_highlight = {
                fg = '#000000',
                bg = '#a6e3a1',
            },
            insert_highlight = {
                fg = '#000000',
                bg = '#89b4fa',
            },
            visual_highlight = {
                fg = '#000000',
                bg = '#f9e2af',
            },
            command_highlight = {
                fg = '#000000',
                bg = '#f38ba8',
            },
            terminal_highlight = {
                fg = '#000000',
                bg = '#94e2d5',
            },
        },
        cursor_line = {
            enabled = true,
            highlight = {
                bg = '#24273a',
            },
        },
    },
    editor = {
        sign_column = {
            enabled = true,
        },
        number_column = {
            enabled = true,
            relative = true,
            highlight = {
                fg = '#6c7086',
            },
            cursor_highlight = {
                fg = '#ffcc66',
                bold = true,
            },
        },
        status_column = {
            enabled = true,
            suffix = '   ',
        },
        general = {
            -- The character used for end-of-buffer filling.
            fill_chars = ' ',
        },
        diagnostic = {
            -- Whether to enable virtual text for diagnostic.
            virtual_text = true,
            -- Whether to enable virtual lines for diagnostic.
            virtual_lines = false,
            -- Whether to update diagnostic in insert mode.
            update_in_insert = true,
            -- Whether to enable underline for diagnostic.
            underline = true,
            -- Whether to enable signs for diagnostic.
            signs = true,
            -- Whether to sort diagnostic by severity.
            severity_sort = true,
        },
    },
    buffer = {
        indent = {
            -- The character used for indentation. Either 'space' or 'tab'.
            type = 'space',
            -- The number of spaces per tab. This is only applied when 'type' is
            -- set to 'space'.
            width = 4,
            -- The number of spaces to use for each step of indent. This is only
            -- applied when 'type' is set to 'tab'.
            display_width = 4,
            -- The number of spaces to use for each step of indent. This is only
            -- applied when 'type' is set to 'tab'. In most cases, this should
            -- be the same as 'width'.
            shift_width = 4,
        },
        ruler = {
            -- Whether to enable the ruler.
            enabled = true,
            -- The columns at which to show the ruler.
            columns = { 80 },
            -- The highlight group for the ruler.
            highlight = { bg = '#333333' },
        },
        treesitter = {
            -- Whether to enable tree-sitter.
            enabled = true,
            -- The tree-sitter parsers to use.
            names = {},
            -- Whether to enable tree-sitter highlight.
            highlight_enabled = true,
        },
        lsp = {
            -- Whether to enable LSP.
            enabled = true,
            -- The LSP server to use.
            name = '',
            -- The Mason packages for the LSP.
            packages = {},
        },
        linter = {
            -- Whether to enable the linter.
            enabled = true,
            -- The linter to use.
            name = '',
            -- The Mason packages for the linter.
            packages = {},
        },
        formatter = {
            -- Whether to enable the formatter.
            enabled = true,
            -- The formatter to use.
            name = '',
            -- The Mason packages for the formatter.
            packages = {},
        },
        debugger = {
            -- Whether to enable the debugger.
            enabled = true,
            -- The debugger to use.
            name = '',
            -- The Mason packages for the debugger.
            packages = {},
        },
        -- Whether to format the buffer automatically on save.
        format_on_save = true,
    },
    system = {
        filetype = {
            exclude = {
                'help',
                'qf',
                'man',
                'terminal',
                'lazy',
                'mason',
            },
        },
        buftype = {
            exclude = {
                'nofile',
                'quickfix',
                'terminal',
                'prompt',
                'help',
            },
        },
        clipboard = {
            -- Whether to enable clipboard integration.
            enable = true,
            -- The name of the clipboard integration tool.
            name = 'HareVim Clipboard Integration',
            -- The host address for clipboard integration.
            host = '',
            -- Whether to enable clipboard caching.
            enabled_cache = true,
            -- The clipboard option to use.
            option = 'unnamedplus',
        },
        terminal = {
            -- The shell to use for the terminal.
            shell = '/bin/bash',
        },
    },
}

return M
