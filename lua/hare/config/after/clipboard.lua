local conf = require 'hare.config.conf'

local clipboard = conf.system.clipboard
vim.opt.clipboard = clipboard.option

-- If host is not empty, set up the remote clipboard integration using curl
-- commands. This requires a server to be running at the specified host that can
-- handle two requests:
--
-- 1. A POST request to the host with the clipboard data in the body, which will
--    be used to update the remote clipboard.
-- 2. A GET request to the host, which will return the current contents of the
--    remote clipboard.
local host = clipboard.host
if host ~= '' then
    local copy_cmd =
        string.format('curl -s -X POST %s -d @-', vim.fn.shellescape(host))
    local paste_cmd = string.format('curl -s %s', vim.fn.shellescape(host))

    vim.g.clipboard = {
        name = clipboard.name,
        copy = { ['+'] = copy_cmd, ['*'] = copy_cmd },
        paste = { ['+'] = paste_cmd, ['*'] = paste_cmd },
        cache_enabled = clipboard.enabled_cache and 1 or 0,
    }
end
