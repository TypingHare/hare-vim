require('conform').setup {
  formatters_by_ft = {
    python = {
      'ruff_fix',
      'ruff_format',
      'ruff_organize_imports',
    },
  },
}
