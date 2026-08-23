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
}

return M
