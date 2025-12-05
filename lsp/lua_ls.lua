return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git', 'stylua.toml', { '.luarc.json', '.luarc.jsonc' } },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
    },
  },
}
