local conf = require 'hare.config.conf'
local utils = require 'hare.utils'

-- Set the sign column, which controls the side gutter to display marks,
-- diagnostics, and git indicators.
local sign_column = conf.editor.sign_column
vim.opt.signcolumn = sign_column.enabled and 'yes' or 'no'

-- Set the number column, which controls the display of line numbers. If
-- `relative` is set to true, the number for the cursor line (the line where the
-- cursor is located) is the absolute line number in the file, and the line
-- numbers before and after increment from 1, respectively.
local number_column = conf.editor.number_column
vim.opt.number = number_column.enabled
vim.opt.relativenumber = number_column.relative
utils.set_hl('LineNr', number_column.highlight)
utils.set_hl('CursorLineNr', number_column.cursor_highlight)

-- Set the status column if enabled. HareVim constructs the status column string
-- based on the sign column and number column settings.
if conf.editor.status_column.enabled then
    local status_column_str = ''
    if sign_column.enabled then
        status_column_str = status_column_str .. '%s'
    end
    if number_column.enabled then
        status_column_str = status_column_str .. '%='
        if number_column.relative then
            status_column_str = status_column_str
                .. '%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : \'\'}'
        else
            status_column_str = status_column_str .. '%{v:lnum}'
        end
    end

    status_column_str = status_column_str .. conf.editor.status_column.suffix

    -- Add an autocommand to update the status column based on the current
    -- buffer's filetype and buftype.
    vim.api.nvim_create_autocmd({
        'VimEnter',
        'WinEnter',
        'WinLeave',
        'BufWinEnter',
        'BufEnter',
        'TermOpen',
        'FileType',
    }, {
        callback = function(args)
            local filetype = vim.bo[args.buf].filetype
            local buftype = vim.bo[args.buf].buftype
            local excluded_filetypes = conf.system.filetype.exclude
            local excluded_buftypes = conf.system.buftype.exclude

            local is_editable = not vim.tbl_contains(
                excluded_filetypes,
                filetype
            ) and not vim.tbl_contains(excluded_buftypes, buftype)
            if is_editable then
                vim.wo.statuscolumn = status_column_str
            else
                vim.wo.statuscolumn = '%s'
            end
        end,
    })
else
    vim.wo.statuscolumn = '%s'
end

-- Set the fill characters for the editor, which control the appearance of empty
-- lines and other UI elements. The default value in Neovim is `~`.
local fill_chars = conf.editor.general.fill_chars
vim.opt.fillchars:append { eob = fill_chars }

-- Set the diagnostic configuration.
local diagnostic = conf.editor.diagnostic
vim.diagnostic.config {
    virtual_text = diagnostic.virtual_text,
    virtual_lines = diagnostic.virtual_lines,
    update_in_insert = diagnostic.update_in_insert,
    underline = diagnostic.underline,
    signs = diagnostic.signs,
    severity_sort = diagnostic.severity_sort,
}
