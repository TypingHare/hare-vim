local M = {}
local keywords

function M.complete(findstart, base)
    local result = vim.fn['syntaxcomplete#Complete'](findstart, base)
    if findstart == 1 then
        return result
    end

    if not keywords then
        keywords = {}
        for _, word in ipairs(vim.fn['syntaxcomplete#OmniSyntaxList'] {
            'sqlStatement',
            'sqlKeyword',
            'sqlType',
        }) do
            keywords[word:lower()] = true
        end
    end

    for i, word in ipairs(result) do
        if keywords[word:lower()] then
            result[i] = word:upper()
        end
    end
    return result
end

return M
