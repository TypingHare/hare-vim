local ok, neotree = pcall(require, 'neo-tree')
if !ok then
    return
end

local function has_pom_xml(path)
    if path == nil then
        return false
    end

    local pom = vim.fs.find('pom.xml', {
        path = path,
        upward = false,
        type = 'file',
    })[1]

    return pom ~= nil
end

local cwd = vim.fn.getcwd()
local git_marker = vim.fs.find('.git', {
    path = cwd,
    upward = true,
})[1]
local git_root = git_marker and vim.fs.dirname(git_marker) or nil

neotree.config.filesystem.group_empty_dirs =
    has_pom_xml(git_root) or has_pom_xml(cwd)
vim.print(neotree.config.filesystem.group_empty_dirs)

-- Open the Neo-tree window.
vim.keymap.set(
    'n',
    '<leader>n',
    ':Neotree<CR>',
    { desc = 'Open Neotree', silent = true }
)
