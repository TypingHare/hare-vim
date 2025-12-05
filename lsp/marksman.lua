return {
  name = 'marksman',
  cmd = { 'marksman', 'server' },
  root_dir = function(bufnr, on_dir)
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    if filepath == '' then
      return -- unsaved buffer, skip
    end

    on_dir(vim.fs.dirname(filepath))
  end,
}
