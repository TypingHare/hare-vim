return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = '▏',
      tab_char = '▏',
    },
    scope = { enabled = false },
    exclude = {
      buftypes = { 'terminal', 'nofile' },
    },
  },
  config = true,
}
