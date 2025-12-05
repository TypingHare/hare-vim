return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  config = function()
    -- TODO: This auto command should be more precise
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*',
      callback = function()
        -- Refresh Neotree
        require('neo-tree.sources.filesystem.commands').refresh(
          require('neo-tree.sources.manager').get_state 'filesystem'
        )
      end,
    })

    vim.keymap.set(
      'n',
      '<leader>gl',
      ':LazyGit<CR>',
      { desc = 'Open Lazygit', silent = true }
    )
  end,
}
