local conf = require 'hare.config.conf'
local utils = require 'hare.utils'

-- Set the highlights for cursor in different modes.
vim.opt.guicursor = {
    'n:block-CursorNormal',
    'i:ver25-CursorInsert',
    'v:block-CursorVisual',
    'V:block-CursorVisual',
    'c:block-CursorCommand',
    't:block-CursorTerminal',
}
utils.set_hl('CursorNormal', conf.appearance.cursor.normal_highlight)
utils.set_hl('CursorInsert', conf.appearance.cursor.insert_highlight)
utils.set_hl('CursorVisual', conf.appearance.cursor.visual_highlight)
utils.set_hl('CursorCommand', conf.appearance.cursor.command_highlight)
utils.set_hl('CursorTerminal', conf.appearance.cursor.terminal_highlight)

-- Enable and set cursor line highlight if the configuration enables it. The
-- cursor line refers to the line where the cursor is currently located. This
-- only applies to normal and insert modes.
local cursor_line_enabled = conf.appearance.cursor_line.enabled
if cursor_line_enabled then
    vim.opt.cursorline = cursor_line_enabled
    if conf.appearance.cursor then
        vim.api.nvim_set_hl(
            0,
            'CursorLine',
            conf.appearance.cursor_line.highlight
        )
    end
end
