local ok_ibl, ibl = pcall(require, 'ibl')
if not ok_ibl then
    return
end

local ok_hare, hare = pcall(require, 'hare-conf')
if not ok_hare or not hare.setup_completed then
    return
end

ibl.update {
    exclude = {
        buftypes = hare.config.system.buftype.exclude,
    },
}

vim.api.nvim_create_autocmd('BufEnter', {
    callback = function(args)
        local bufnr = args.buf
        local filetype = vim.bo[bufnr].filetype
        local indent_width = hare.fn.get_buffer_config(filetype).indent.width
        if indent_width <= 2 then
            ibl.setup_buffer(bufnr, { enabled = false })
        end
    end,
})
