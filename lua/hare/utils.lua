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

return M
