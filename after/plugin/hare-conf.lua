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
}
hc.fn.enable_languages_in_config()

hc.builtin.apply_config(hc.config)
hc.builtin.install_treesitters()
hc.builtin.install_mason_packages()
hc.builtin.enable_lsp()
hc.builtin.set_up_conform()
