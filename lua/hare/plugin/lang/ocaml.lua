return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters = {
                ocamlformat = {
                    args = { '--name', '$FILENAME', '-' },
                    -- Neovim also uses 'ocaml' for ocamllex and Menhir files;
                    -- ocamlformat only handles OCaml implementations/interfaces.
                    condition = function(_, ctx)
                        local extension = vim.fn.fnamemodify(ctx.filename, ':e')
                        return extension == 'ml' or extension == 'mli'
                    end,
                },
            },
        },
    },
}
