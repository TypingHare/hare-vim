-- Load all keymap files
-- TODO: Remove this
local keymap_dir = vim.fn.stdpath 'config' .. '/lua/hare/config/keymap'
for _, file in ipairs(vim.fn.readdir(keymap_dir)) do
  if file:match '%.lua$' then
    local module = 'hare.config.keymap.' .. file:gsub('%.lua$', '')
    require(module)
  end
end
