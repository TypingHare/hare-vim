-- This script checks if lazy.nvim is installed; if it is not installed, clone the remote
-- repository from GitHub and save it to `~/.local/share/nvim/lazy/`.

-- Path to the lazy.nvim package; on Linux, it is `~/.local/share/nvim/lazy/lazy.nvim`.
local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- Clone the repository if the package doesn't exist.
if not vim.uv.fs_stat(lazy_path) then
    local lazy_repo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazy_repo,
        lazy_path,
    }
end

-- Prepend the Lazy path to the Neovim runtime path.
vim.opt.rtp:prepend(lazy_path)

-- Set up Lazy.
require('lazy').setup {
    spec = {
        { import = 'hare.plugin' },
        { import = 'hare.plugin.lang' },
    },
}
