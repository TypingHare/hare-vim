local conf = require 'hare.config.conf'
local lang = require 'hare.config.lang'
local utils = require 'hare.utils'

--- @types string[]
local enabled_langs = { 'lua', 'json', 'toml', 'yaml', 'bash', 'go' }

-- Get the default buffer configuration from the main configuration.
local default_buffer_conf = conf.buffer

-- Creates a table mapping filetypes to their corresponding language-specific
-- buffer configurations.
--- @type table<string, hare.buffer>
local lang_buffer_confs_by_ft = {}
for _, lang_name in ipairs(enabled_langs) do
    local lang_conf = lang[lang_name]
    if not lang_conf then
        vim.notify(
            string.format('Language configuration for %s not found', lang_name),
            vim.log.levels.WARN
        )
    else
        for _, ft in ipairs(lang_conf.filetypes) do
            lang_buffer_confs_by_ft[ft] = utils.merge_buffer_conf(
                default_buffer_conf,
                lang_conf.buffer_config
            )
        end
    end
end

-- Retrieves the buffer configuration for a given filetype. If no specific
-- configuration is found for the filetype, it returns the default buffer
-- configuration.
--
--- @param ft string
--- @return hare.buffer
local function get_buffer_conf(ft)
    return lang_buffer_confs_by_ft[ft] or default_buffer_conf
end

-- Collect filetypes that enables treesitter highlighting.
---@type string[]
local enabled_highlight_filetypes = {}
for ft, buffer_conf in pairs(lang_buffer_confs_by_ft) do
    if
        buffer_conf.treesitter.enabled
        and buffer_conf.treesitter.highlight_enabled
    then
        table.insert(enabled_highlight_filetypes, ft)
    end
end

-- Set up an autocommand for filetypes that have treesitter highlighting
-- enabled.
vim.api.nvim_create_autocmd('FileType', {
    pattern = enabled_highlight_filetypes,
    callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype == 'nofile' then
            return
        end

        vim.treesitter.start()
    end,
})

-- Install required Tree-sitter parsers based on buffer configuration.
local ok_parsers, parsers = pcall(require, 'nvim-treesitter.parsers')
local ok_config, config = pcall(require, 'nvim-treesitter.config')
if ok_parsers and ok_config then
    -- Collect unique parser names from the buffer configurations.
    ---@type string[]
    local parser_names = {}

    local function insert_if_valid(name)
        if name ~= '' and not vim.tbl_contains(parser_names, name) then
            table.insert(parser_names, name)
        end
    end

    for _, buffer_config in pairs(lang_buffer_confs_by_ft) do
        local lang_parser_names = buffer_config.treesitter.names
        if lang_parser_names then
            for _, name in ipairs(lang_parser_names) do
                insert_if_valid(name)
            end
        end
    end

    -- Collect parsers that are yet installed.
    local parsers_to_install =
        utils.difference(parser_names, config.get_installed())
    parsers_to_install = utils.filter(parsers_to_install, function(name)
        return parsers[name] ~= nil
    end)

    -- Install missing tree-sitter parsers.
    if #parsers_to_install > 0 then
        vim.cmd('TSInstall ' .. table.concat(parsers_to_install, ' '))
    end
else
    vim.notify(
        'Failed to load nvim-treesitter modules. Tree-sitter parsers will '
            .. 'not be installed.',
        vim.log.levels.WARN
    )
end

-- Set up an autocommand to configure indentation-related buffer settings based
-- on the filetype.
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        local buffer_conf = get_buffer_conf(ft)
        vim.bo[bufnr].expandtab = buffer_conf.indent.type == 'space'

        --- @type number
        local width = buffer_conf.indent.width
        local display_width = buffer_conf.indent.display_width or width
        local shift_width = buffer_conf.indent.shift_width or width
        vim.bo[bufnr].softtabstop = width
        vim.bo[bufnr].tabstop = display_width
        vim.bo[bufnr].shiftwidth = shift_width
    end,
})

local ok_mason_registry, mason_registry = pcall(require, 'mason-registry')
local ok_mappings, mappings = pcall(require, 'mason-lspconfig.mappings')
if ok_mason_registry and ok_mappings then
    local add_package_name_to_list = function(name_list, package_name)
        if not vim.tbl_contains(name_list, package_name) then
            table.insert(name_list, package_name)
        end
    end

    --- Resolves mason package names from a hareconf tool entry and adds them to
    --- the provided list.
    ---
    --- @param name_list string[] - List of mason package names.
    --- @param tool_entry hare.buffer.lsp
    ---     | hare.buffer.formatter
    ---     | hare.buffer.linter
    ---     | hare.buffer.debugger
    ---     - A mason package entry.
    local resolve_package_names = function(name_list, tool_entry)
        if not tool_entry then
            return
        end

        -- Resolve the 'name' field.
        local package_name = tool_entry.name
        if package_name and package_name ~= '' then
            add_package_name_to_list(name_list, package_name)
        end

        -- Resolve the 'packages' field.
        local packages = tool_entry.packages
        if packages and vim.islist(packages) then
            for _, package_entry in pairs(packages) do
                add_package_name_to_list(name_list, package_entry.package_name)
            end
        end
    end

    ---@type string[]
    local package_names = {}
    for _, buffer_conf in pairs(lang_buffer_confs_by_ft) do
        resolve_package_names(package_names, buffer_conf.lsp)
        resolve_package_names(package_names, buffer_conf.formatter)
        resolve_package_names(package_names, buffer_conf.linter)
        resolve_package_names(package_names, buffer_conf.debugger)
    end

    local lspconfig_to_package = mappings.get_mason_map().lspconfig_to_package
    local function resolve_mason_name(name)
        return name and lspconfig_to_package[name] or name
    end

    -- Resolve missing names of missing packages. A missing package is one that
    -- is not installed but found in the mason registry.
    ---@type string[]
    local packages_to_install = {}
    ---@type string[]
    local packages_not_found = {}
    for _, package_name in ipairs(package_names) do
        local ok_installable, _package =
            pcall(mason_registry.get_package, package_name)
        if ok_installable and not _package:is_installed() then
            table.insert(packages_to_install, package_name)
        else
            local mason_name = resolve_mason_name(package_name) or ''
            local ok_installable_mason, mason_package =
                pcall(mason_registry.get_package, mason_name)
            if ok_installable_mason then
                if not mason_package:is_installed() then
                    table.insert(packages_to_install, mason_name)
                end
            else
                table.insert(packages_not_found, package_name)
            end
        end
    end

    if #packages_not_found > 0 then
        vim.notify(
            'Some Mason packages not found: '
                .. table.concat(packages_not_found, ', '),
            vim.log.levels.WARN
        )
    end

    if #packages_to_install > 0 then
        vim.notify(
            'Installing missing Mason packages: '
                .. table.concat(packages_to_install, ', ')
        )
        for _, package_name in ipairs(packages_to_install) do
            local _package = mason_registry.get_package(package_name)
            _package:install()
        end
    end
else
    vim.warn(
        'Plugin "mason-registry" or "mason-lspconfig" not installed; skipping '
            .. 'mason package installation.'
    )
end

-- Set up an autocommand to format the buffer on save if the buffer
-- configuration specifies that formatting on save is enabled.
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function(args)
        local ok, conform = pcall(require, 'conform')
        if not ok then
            return
        end

        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        local buffer_conf = get_buffer_conf(ft)

        if buffer_conf.format_on_save then
            conform.format { bufnr = bufnr }
        end
    end,
})

-- Enable LSP servers for filetypes that have LSP enabled in their buffer
-- configuration.
for _, buffer_conf in pairs(lang_buffer_confs_by_ft) do
    --- @type hare.buffer.lsp
    local lsp = buffer_conf.lsp
    if lsp.enabled then
        -- Resolve the 'name' field.
        if lsp.name and lsp.name ~= '' then
            vim.lsp.enable(lsp.name)
        end

        -- Resolve the 'packages' field.
        if lsp.packages and vim.islist(lsp.packages) then
            for _, package_entry in pairs(lsp.packages) do
                if
                    package_entry.executable
                    and package_entry.executable ~= ''
                then
                    vim.lsp.enable(package_entry.executable)
                end
            end
        end
    end
end

-- Set up the Conform plugin for formatting based on the buffer configurations.
local ok, conform = pcall(require, 'conform')
if ok then
    ---@type table<string, string[]>
    local formatters_by_ft = {}
    for ft, buffer_conf in pairs(lang_buffer_confs_by_ft) do
        --- @type hare.buffer.formatter
        local formatter = buffer_conf.formatter
        if formatter.enabled then
            -- Resolve the 'name' field.
            if formatter.name and formatter.name ~= '' then
                formatters_by_ft[ft] = { formatter.name }
            end

            -- Resolve the 'packages' field; support multiple formatters for a
            -- single filetype.
            if formatter.packages and vim.islist(formatter.packages) then
                ---@type string[]
                local formatters = {}
                for _, package_entry in pairs(formatter.packages) do
                    local executable = package_entry.executable
                    if executable and executable ~= '' then
                        table.insert(formatters, executable)
                    end
                end
                formatters_by_ft[ft] = formatters
            end
        end
    end

    conform.setup { formatters_by_ft = formatters_by_ft }
else
    vim.notify(
        'Plugin "Conform" not installed; skipping formatter setup.',
        vim.log.levels.WARN
    )
end
