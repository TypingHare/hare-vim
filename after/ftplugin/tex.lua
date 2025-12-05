vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', '^', 'g^', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', '$', 'g$', { buffer = true, noremap = true, silent = true })

-- Disable the spell check, use typos instead
vim.opt_local.spell = false

vim.cmd 'SoftWrapMode'

require('conform').setup {
  formatters_by_ft = {
    tex = { 'latexindent' },
    plaintex = { 'latexindent' },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 2000,
  },
}
