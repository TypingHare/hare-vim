-- This script is executed before lazy.nvim is loaded.

-- Disable Netrw (short for network-oriented reading, writing, and browsing). It
-- is the default file explorer plugin for Neovim. Since it is quite limited, we
-- replace it with a more feature-rich plugin Neotree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- By first mapping <Space> to <Nop>, space is prevented from triggering any
-- default behavior before it is used as <leader>.
vim.keymap.set('', '<Space>', '<Nop>', { silent = true, noremap = true })

-- Leaders must be set before lazy.nvim is loaded.
--
-- `vim.g.mapleader` defines the key used for global leader mappings, while
-- `vim.g.maplocalleader` defines the key used for local leader mappings. The
-- latter is intended for mappings that are specific to filetype, plugin, or
-- buffer context.
--
-- For simplity, we set both leader keys to spaces.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Speed up startup time by caching Lua modules. It makes `require()` for Lua
-- modules faster by caching the results of parsing/compiling Lua files.
vim.loader.enable()
