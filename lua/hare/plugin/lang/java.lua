return {
    -- [https://github.com/nvim-java/nvim-java]
    {
        'nvim-java/nvim-java',
        config = function()
            require('java').setup()

            vim.lsp.config('jdtls', {
                settings = {
                    java = {
                        format = {
                            enabled = true,
                            settings = {
                                profile = 'Default',
                            },
                        },
                    },
                },
                before_init = function(_, config)
                    if config.root_dir then
                        config.settings.java.format.settings.url =
                            vim.uri_from_fname(
                                vim.fs.joinpath(
                                    config.root_dir,
                                    '.eclipse-formatter.xml'
                                )
                            )
                    end
                end,
            })

            vim.lsp.enable 'jdtls'
        end,
    },
}
