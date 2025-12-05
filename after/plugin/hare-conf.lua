-- Use HareConf builtin functions
local ok, hc = pcall(require, 'hare-conf')
if not ok then
    return
end

hc.builtin.apply_config(hc.config)
hc.builtin.enable_languages_in_config()
hc.builtin.install_treesitters()
hc.builtin.install_mason_packages()
hc.builtin.enable_lsp()
hc.builtin.set_up_conform()
