return {
    -- This plugin allows you to use lazygit in Neovim.
    --
    -- [https://github.com/kdheepak/lazygit.nvim]
    {
        'kdheepak/lazygit.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        cmd = { 'LazyGit' },
    },
}
