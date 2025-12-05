-- This plugin shows a colorcolumn only when it’s needed, instead of having it
-- always on.
--
-- [https://github.com/m4xshen/smartcolumn.nvim]

return {
    'm4xshen/smartcolumn.nvim',
    config = true,
    opts = {
        custom_colorcolumn = function()
            local MAX_WIDTH = '4096'
            local DEFAULT_WIDTH = 100

            local ok, hc = pcall(require, 'hare-conf')
            if not ok then
                return tostring(DEFAULT_WIDTH)
            end

            local filetype = vim.bo.filetype
            local exclude_filetypes = hc.config.system.filetype.exclude
            if vim.tbl_contains(exclude_filetypes, filetype) then
                return MAX_WIDTH
            end

            local buftype = vim.bo.buftype
            local exclude_buftypes = hc.config.system.buftype.exclude
            if vim.tbl_contains(exclude_buftypes, buftype) then
                return MAX_WIDTH
            end

            local buffer_config = hc.fn.get_buffer_config(filetype)
            if buffer_config.ruler.enabled then
                return tostring(buffer_config.ruler.columns[1] or DEFAULT_WIDTH)
            else
                return MAX_WIDTH
            end
        end,
    },
}
