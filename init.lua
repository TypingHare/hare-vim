require 'hare'

-- Define cursor highlight groups (=> HareConf)
vim.api.nvim_set_hl(0, 'CursorNormal', { fg = '#000000', bg = '#a6e3a1' })
vim.api.nvim_set_hl(0, 'CursorInsert', { fg = '#000000', bg = '#89b4fa' })
vim.api.nvim_set_hl(0, 'CursorVisual', { fg = '#000000', bg = '#f9e2af' })
vim.api.nvim_set_hl(0, 'CursorCommand', { fg = '#000000', bg = '#f38ba8' })
vim.api.nvim_set_hl(0, 'CursorTerminal', { fg = '#000000', bg = '#94e2d5' })

-- Configure cursor per mode
vim.opt.guicursor = {
    'n:block-CursorNormal',
    'v:block-CursorVisual',
    'V:block-CursorVisual',
    'c:block-CursorCommand',
    'i:ver25-CursorInsert',
    't:block-CursorTerminal',
}

vim.g.vimtex_syntax_enabled = 0
