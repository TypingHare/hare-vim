----------------------------------------------------------------------------------------------------
--- Application                                                                                  ---
----------------------------------------------------------------------------------------------------

-- Save all buffers and quit Neovim.
vim.keymap.set('n', '<leader>qa', ':wa<CR>:qa<CR>', { desc = 'Save & Quit', silent = true })

-- Forcibly quit Neovim without saving buffers.
vim.keymap.set('n', '<leader>qf', ':qa!<CR>', { desc = 'Force Quit', silent = true })

----------------------------------------------------------------------------------------------------
--- Window Control                                                                               ---
----------------------------------------------------------------------------------------------------

-- Control window.
vim.keymap.set('n', '<leader>w', '<C-W>', { desc = 'Window', silent = true })

-- Focus on the window on the left.
vim.keymap.set('n', '<C-h>', '<C-W>h', {
    desc = 'Move focus to left window',
    silent = true,
})

-- Focus on the window above.
vim.keymap.set('n', '<C-j>', '<C-W>j', {
    desc = 'Move focus to lower window',
    silent = true,
})

-- Focus on the window below.
vim.keymap.set('n', '<C-k>', '<C-W>k', {
    desc = 'Move focus to upper window',
    silent = true,
})

-- Focus on the window on the right.
vim.keymap.set('n', '<C-l>', '<C-W>l', {
    desc = 'Move focus to right window',
    silent = true,
})

----------------------------------------------------------------------------------------------------
--- Editor Behaviors                                                                             ---
----------------------------------------------------------------------------------------------------

-- Clear highlight research when pressing escape in all modes.
vim.keymap.set('n', '<Esc>', '<Esc>:nohlsearch<CR>', { desc = 'Exit Current Mode', silent = true })

-- Move the cursor to the next line (insert mode).
vim.keymap.set('i', '<S-Enter>', '<ESC>o', { desc = 'Move to Next Line', silent = true })

-- Move the cursor to the next line (normal mode).
vim.keymap.set('n', '<S-Enter>', 'o<ESC>', { desc = 'Move to Next Line', silent = true })

----------------------------------------------------------------------------------------------------
--- Terminal                                                                                     ---
----------------------------------------------------------------------------------------------------

-- Open a terminal buffer.
vim.keymap.set('n', '<leader>tt', ':terminal<CR>', { desc = 'Open Terminal', silent = true })

-- If the terminal buffer is not lazygit, then <Esc> can bring the user back to the normal mode.
vim.keymap.set('t', '<Esc>', function()
    local ft = vim.bo.filetype
    if ft ~= 'lazygit' then
        vim.cmd 'stopinsert'
    end
end, { silent = true })

----------------------------------------------------------------------------------------------------
--- Coding                                                                                       ---
----------------------------------------------------------------------------------------------------

-- Refresh the buffer.
vim.keymap.set('n', '<leader>ce', ':e!<CR>', { desc = 'Refresh Buffer', silent = true })

-- Format the current file. It uses Conform if it exists; otherwise, use Neovim's built-in LSP
-- formatting instead.
vim.keymap.set('n', '<leader>cf', function()
    local ok, conform = pcall(require, 'conform')
    if ok then
        conform.format()
        return
    end

    local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }
    if #clients > 0 then
        vim.lsp.buf.format { async = true }
    else
        vim.notify(
            'No formatter available (conform not installed, and no LSP attached)',
            vim.log.levels.WARN
        )
    end
end, { desc = 'Format File', silent = true })

-- Rename the identifier under the cursor.
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename Identifier', silent = true })
