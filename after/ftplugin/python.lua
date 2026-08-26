local ok, conform = pcall(require, 'conform')
if not ok then
    return
end

conform.setup {
    formatters_by_ft = {
        python = {
            'ruff_fix',
            'ruff_format',
            'ruff_organize_imports',
        },
    },
}

local function get_ruff_line_length()
    local ruff = vim.fn.expand '~/.local/share/nvim/mason/bin/ruff'

    if vim.fn.executable(ruff) ~= 1 then
        return nil
    end

    local result = vim.system(
        { ruff, 'check', '--show-settings' },
        { text = true }
    )
        :wait()

    if result.code ~= 0 or not result.stdout then
        return nil
    end

    local value = result.stdout:match 'linter%.line_length%s*=%s*(%d+)'
    return value and tonumber(value) or nil
end

local ruff_line_length = get_ruff_line_length()
local lang = require 'hare.config.lang'
lang['go'].buffer_config.ruler = { columns = { ruff_line_length or 80 } }
