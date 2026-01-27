local ok, hare = pcall(require, 'hare-conf')
if not ok or not hare.setup_completed then
    return
end

-- Load builtin language support (use `Hareconf lang` to check all supported languages).
-- You can also add your own language support using `hare.fn.set_language_config`.
hare.builtin.language.setup()
-- Enable languages specified in Hare configuration
-- Add language names in neoconf.json `HareConf -> language -> names`
hare.fn.enable_languages_in_config()

-- Set up appearance features based on the `appearance` entry in the Hare configuration.
hare.builtin.appearance.setup()
-- Set up clipboard features based on the `clipboard` entry in the Hare configuration.
hare.builtin.clipboard.setup()

-- Set up editor features based on the `editor` entry in the Hare configuration.
hare.builtin.editor.setup()
-- Install treesitter parsers for the languages enabled in the Hare configuration.
hare.builtin.editor.install_treesitter_parsers()
-- Install mason packages for the languages enabled in the Hare configuration.
hare.builtin.editor.install_mason_packages()
-- Enable LSP servers for the languages enabled in the Hare configuration.
hare.builtin.editor.enable_lsp()
-- Apply formatters for the languages enabled in the Hare configuration.
hare.builtin.editor.apply_formatters()

hare.config.editor.filetype['javascript'].ruler.columns = { 80 }
hare.config.editor.filetype['typescript'].ruler.columns = { 80 }
hare.config.editor.filetype['typescriptreact'].ruler.columns = { 80 }

hare.fn.clear_buffer_config_cache()
