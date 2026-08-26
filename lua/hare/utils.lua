local M = {}

--- Sets a highlight group.
---
--- @param group_name string - The name of the highlight group.
--- @param group table|vim.api.keyset.highlight|nil - The highlight group
---     definition. If nil, no action will be taken.
function M.set_hl(group_name, group)
    if group then
        vim.api.nvim_set_hl(0, group_name, group)
    end
end

--- Deep copies a default buffer configuration and merges it with a
--- language-specific buffer configuration.
---
--- @param default_buffer_conf hare.buffer - The default buffer configuration.
--- @param lang_buffer_conf hare.buffer - The language-specific buffer
---     configuration.
--- @return hare.buffer
function M.merge_buffer_conf(default_buffer_conf, lang_buffer_conf)
    local buffer_conf = vim.deepcopy(default_buffer_conf)
    return vim.tbl_deep_extend('force', buffer_conf, lang_buffer_conf)
end

-- Returns the elements in `a` that are not present in `b`.
--
--- @param a any[] - A set of elements.
--- @param b any[] - A set of elements to be excluded from `a`.
--- @return any[] - A new table containing the elements in `a` that are not
---     present in `b`.
function M.difference(a, b)
    local seen = {}
    for _, v in ipairs(b) do
        seen[v] = true
    end

    local result = {}
    for _, v in ipairs(a) do
        if not seen[v] then
            table.insert(result, v)
        end
    end

    return result
end

-- Returns a new table containing the elements of `tbl` that satisfy the
-- given predicate function.
--
--- @param tbl any[] - A table of elements to be filtered.
--- @param predicate fun(value: any): boolean - A function that takes an
---     element of `tbl` and returns true if it should be included in the
---     result, or false otherwise.
--- @return any[] - A new table containing the elements of `tbl` that satisfy
---     the predicate function.
function M.filter(tbl, predicate)
    local result = {}
    for _, v in ipairs(tbl) do
        if predicate(v) then
            table.insert(result, v)
        end
    end

    return result
end

return M
