local ok, smartcolumn = pcall(require, 'smartcolumn')
if not ok then
    return
end

local buffer = require 'hare.config.after.buffer'

local function get_ruler_columns(ft, buftype)
    local conf = require 'hare.config.conf'
    local exclude_filetypes = conf.system.filetype.exclude
    if vim.tbl_contains(exclude_filetypes, ft) then
        return nil
    end

    local exclude_buftypes = conf.system.buftype.exclude
    if vim.tbl_contains(exclude_buftypes, buftype) then
        return nil
    end

    local buffer_conf = buffer.get_buffer_conf(ft)
    if buffer_conf.ruler.enabled then
        return buffer_conf.ruler.columns
    else
        return nil
    end
end

smartcolumn.setup {
    custom_colorcolumn = function()
        local MAX_WIDTH = '4096'
        local DEFAULT_WIDTH = '100'

        if vim.bo.filetype == '' or vim.bo.filetype == 'conf' then
            return MAX_WIDTH
        end

        local ruler_columns = get_ruler_columns(vim.bo.filetype, vim.bo.buftype)
        if not ruler_columns then
            return MAX_WIDTH
        end

        return tostring(ruler_columns[1] or DEFAULT_WIDTH)
    end,
}
