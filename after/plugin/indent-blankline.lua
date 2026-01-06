local ok_ibl, ibl = pcall(require, 'ibl')
if not ok_ibl then
    return
end

local ok_hare, hare = pcall(require, 'hare-conf')
if not ok_hare or not hare.setup_completed then
    return
end

ibl.update {
    exclude = {
        buftypes = hare.config.system.buftype.exclude,
    },
}
