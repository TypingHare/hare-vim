local ok, smartcolumn = pcall(require, 'smartcolumn')
if not ok then
    return
end

smartcolumn.setup {
    custom_colorcolumn = function()
        local MAX_WIDTH = '4096'
        local DEFAULT_WIDTH = '100'

        local ok_hare, hare = pcall(require, 'hare-conf')
        if not ok_hare or not hare or not hare.setup_completed then
            return DEFAULT_WIDTH
        end

        local ruler_columns = hare.fn.get_ruler_columns(vim.bo.filetype, vim.bo.buftype)
        if not ruler_columns then
            return MAX_WIDTH
        end

        return tostring(ruler_columns[1] or DEFAULT_WIDTH)
    end,
}
