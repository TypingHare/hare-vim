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

-- Set the highlight for cursor line.
if conf.appearance.cursor then
    vim.api.nvim_set_hl(0, 'CursorLine', conf.appearance.cursor_line.highlight)
end
