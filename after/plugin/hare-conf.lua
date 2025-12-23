-- Use HareConf builtin functions
local ok, hc = pcall(require, 'hare-conf')
if not ok then
    return
end

hc.builtin.use_builtin_language_config()
hc.fn.set_language_config {
    kotlin = {
        filetypes = { 'kotlin', 'kt', 'kts' },
        buffer_config = {
            treesitter = { name = 'kotlin' },
            lsp = { name = 'kotlin_language_server' },
            linter = { name = 'ktlint' },
            formatter = { name = 'ktlint' },
            ruler = { columns = { 100 } },
        },
    },
    go = {
        filetypes = { 'go' },
        buffer_config = {
            treesitter = { name = 'go' },
            lsp = { name = 'gopls' },
            linter = { name = 'golangci-lint' },
            formatter = { name = 'gofumpt' },
            ruler = { columns = { 100 } },
        },
    },
    latex = {
        filetypes = { 'tex', 'bib' },
        buffer_config = {
            treesitter = { name = 'bibtex', highlight_enabled = false },
            lsp = { name = 'texlab' },
            formatter = { name = 'latexindent' },
            ruler = { enabled = false },
        },
    },
}
hc.fn.enable_languages_in_config()

hc.config.editor.filetype['tex'].treesitter.highlight_enabled = false

hc.builtin.apply_config(hc.config)
hc.builtin.install_treesitters()
hc.builtin.install_mason_packages()
hc.builtin.enable_lsp()
hc.builtin.set_up_conform()
