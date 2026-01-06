-- This script is run before it is lazy.nvim is loaded.

-- Disable Netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- By first mapping <Space> to <Nop>, space is prevented from triggering any default behavior
-- before it is used as <leader>.
vim.keymap.set('', '<Space>', '<Nop>', { silent = true, noremap = true })

-- Leader must be set before lazy.nvim is loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Speed up startup time by caching Lua modules.
vim.loader.enable()
