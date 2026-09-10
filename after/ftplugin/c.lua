-- This file is temporary. It will be merged to central configuration
-- management.
local dap = require 'dap'

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
    },
}
