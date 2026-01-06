-- Disable vimtex syntax highlighting.
vim.g.vimtex_syntax_enabled = 0

-- Disable the spell check, use typos instead.
vim.opt_local.spell = false

vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', '^', 'g^', { buffer = true, noremap = true, silent = true })
vim.keymap.set('n', '$', 'g$', { buffer = true, noremap = true, silent = true })

vim.cmd 'SoftWrapMode'
