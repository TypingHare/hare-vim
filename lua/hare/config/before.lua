-- Leader must be set before lazy.nvim is loaded
vim.keymap.set('', '<Space>', '<Nop>', { silent = true, noremap = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd({ 'WinEnter', 'TermOpen', 'BufEnter' }, {
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local bt = vim.bo[buf].buftype

    local excluded = {
      ['neo-tree'] = true,
      ['terminal'] = true,
    }

    local is_editable = bt == ''
      and vim.bo[buf].modifiable == true
      and not excluded[ft]

    if is_editable then
      vim.wo.statuscolumn =
        [[%s%=%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : ''}   ]]
    else
      -- Non-empty string to override default behavior
      -- This draws only signs (if any) and no numbers
      vim.wo.statuscolumn = '%s'
    end
  end,
})

-- Speed up startup time by caching Lua modules
vim.loader.enable()
