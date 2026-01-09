local ok, telescope = pcall(require, 'telescope')
if not ok then
    return
end

telescope.setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
            preview_width = 0.6,
        },
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        oldfiles = {
            hidden = true,
            -- sorter = require('telescope.sorters').get_substr_matcher(),
        },
    },
}

-- Find files in the project scope.
vim.keymap.set(
    'n',
    '<leader>ff',
    ':Telescope find_files<CR>',
    { desc = 'Find Files', silent = true }
)

-- Find buffers.
vim.keymap.set(
    'n',
    '<leader>fb',
    ':Telescope buffers<CR>',
    { desc = 'Find Buffers', silent = true }
)

-- Find old files in the project scope. Old files refer to the files that were opened and recorded
-- before by Neovim.
vim.keymap.set('n', '<leader>fo', function()
    require('telescope.builtin').oldfiles { cwd_only = true }
end, { desc = 'Find Old Files', silent = true })

-- Find files that have the same extension as the file in the current buffer.
vim.keymap.set('n', '<leader>ft', function()
    local builtin = require 'telescope.builtin'
    local ext = vim.fn.expand '%:e'

    builtin.find_files {
        find_command = { 'fd', '--type', 'f', '--extension', ext },
        prompt_title = 'Files with extension: ' .. ext,
    }
end, { desc = 'Find Same Type', silent = true })

-- Find files by matching specific content.
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live Grep', silent = true })

-- Go to the definition under the cursor.
vim.keymap.set(
    'n',
    'gd',
    require('telescope.builtin').lsp_definitions,
    { desc = 'Go to Definition', silent = true }
)

vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, {
    desc = 'Go to References',
    silent = true,
})
