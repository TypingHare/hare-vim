return {
    -- This plugin provides smart Lua language-server configuration and type definitions, mainly
    -- to improve Lua development inside Neovim configs and plugins.
    --
    -- It configures Lua language server (LuaLS) correctly, provides accurate type definitions,
    -- loads types only when needed, to stay fast. It fixes the following issues:
    --
    --     - `vim` globals marked as undefined
    --     - Missing or incorrect autocompletion
    --     - No type info for plugins like Telescope, Treesitter, or Lazy
    --     - Manually maintaining LuaLS settings and runtime paths
    --
    -- [https://github.com/folke/lazydev.nvim]
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                {
                    path = '${3rd}/luv/library',
                    words = { 'vim%.uv' },
                },
            },
        },
    },
}
