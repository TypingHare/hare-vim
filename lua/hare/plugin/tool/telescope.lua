return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
          preview_width = 0.6,
        },
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        oldfiles = {
          hidden = true,
          sorter = require('telescope.sorters').get_substr_matcher(),
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    }

    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'file_browser'
  end,
}
