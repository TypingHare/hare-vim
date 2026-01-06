local ok, _ = pcall(require, 'noice')
if not ok then
    return
end

vim.keymap.set('n', '<leader>h', function()
    local notify = require 'notify'
    local Popup = require 'nui.popup'
    local event = require('nui.utils.autocmd').event

    local history = notify.history()
    if vim.tbl_isempty(history) then
        vim.notify('No notifications yet', vim.log.levels.INFO)
        return
    end

    local popup = Popup {
        relative = 'editor',
        position = '50%',
        size = {
            width = math.floor(vim.o.columns * 0.7),
            height = math.floor(vim.o.lines * 0.6),
        },
        border = {
            style = 'rounded',
            text = {
                top = ' Notification History ',
                top_align = 'center',
            },
        },
        win_options = {
            wrap = true,
            linebreak = true,
            cursorline = true,
        },
    }

    local lines = {}
    for i = #history, 1, -1 do
        local item = history[i]
        local icon = item.icon or ''
        local level = item.level or 'INFO'
        local message = vim.inspect(item.message)
        local title = item.title[1]
        local time_str = os.date('%Y-%m-%dT%H:%M:%S', math.floor(item.time))
        table.insert(lines, string.format('%s %s %s %s %s', time_str, title, icon, level, message))
    end

    popup:mount()

    vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, lines)
    vim.bo[popup.bufnr].modifiable = false
    vim.bo[popup.bufnr].filetype = 'notify-history'
    vim.api.nvim_set_current_win(popup.winid)

    -- Close mappings
    popup:map('n', 'q', function()
        popup:unmount()
    end, { noremap = true })
    popup:map('n', '<Esc>', function()
        popup:unmount()
    end, { noremap = true })

    -- Auto close on buffer leave
    popup:on(event.BufLeave, function()
        popup:unmount()
    end)
end, {
    desc = 'Notification History',
    silent = true,
})
