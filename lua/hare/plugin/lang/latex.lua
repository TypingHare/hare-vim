return {
    -- This plugin is a full-featured LaTeX workflow plugin for Neovim. It provides a complete set
    -- of features such as compiling, previewing, and navigating errors.
    --
    -- [https://github.com/lervag/vimtex]
    {
        'lervag/vimtex',
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_view_skim_activate = 1
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_reading_bar = 1

            vim.g.vimtex_lint_enabled = 0
            vim.g.vimtex_quickfix_mode = 0

            vim.g.vimtex_compiler_latexmk = {
                build_dir = 'latex_build',
                options = {
                    '-pdf',
                    '-shell-escape',
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                },
            }
        end,
    },
}
