require('conform').setup {
  formatters = {
    sqruff = {
      command = 'sqruff',
      args = { 'fix', '-' },
      stdin = true,
    },
  },
}
