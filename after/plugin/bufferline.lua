local ok, _ = pcall(require, 'bufferline')
if not ok then
    return
end

-- Select the next buffer in cycles.
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next Buffer', silent = true })

-- Select the previous buffer in cycles.
vim.keymap.set(
    'n',
    '<S-Tab>',
    ':BufferLineCyclePrev<CR>',
    { desc = 'Previous Buffer', silent = true }
)

-- Save all buffers.
vim.keymap.set('n', '<leader>bs', ':wa<CR>', { desc = 'Save All Buffers', silent = true })

-- Save all buffers and close all other buffers.
vim.keymap.set('n', '<leader>bo', function()
    vim.cmd 'wa'
    vim.cmd 'BufferLineCloseOthers'
end, { desc = 'Close Other Buffers', silent = true })

-- Save and close the current buffer; select the previous buffer in cycles if it exists.
vim.keymap.set('n', '<leader>bd', function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local is_modifiable = vim.bo.modifiable
    local is_readonly = vim.bo.readonly

    if name ~= '' and is_modifiable and not is_readonly then
        vim.cmd 'write!'
    end

    require('bufferline.commands').cycle(-1)
    vim.cmd('bdelete! ' .. buf)
end, { desc = 'Close Buffer', silent = true })
