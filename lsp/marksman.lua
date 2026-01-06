return {
    name = 'marksman',
    cmd = { 'marksman', 'server' },
    root_dir = function(bufnr, on_dir)
        -- Set the root directory as the directory where the file locates.
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        if filepath == '' then
            return
        end

        on_dir(vim.fs.dirname(filepath))
    end,
}
