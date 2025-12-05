return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  settings = {
    json = {
      schemas = {
        require('schemastore').json.schemas(),
        require('hare-conf').fn.get_json_schema(),
      },
      validate = { enable = true },
    },
  },
}
