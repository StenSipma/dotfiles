local all_attach = require'completion'.on_attach

-- Work in progress...
pylsconf = {
        -- Not sure if this actually does anything...
        settings = {
                configurationSources = "flake8",
                plugins = {
                        pycodestyle = {
                                enabled = false
                        }
                }
        },
        on_attach = all_attach
}

return {
        pylsconf = pylsconf
}
