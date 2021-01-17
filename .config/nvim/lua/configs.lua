local all_attach = require'completion'.on_attach

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
        -- capabilities = capabilities,
        on_attach = all_attach
}

treesitterconf = {
         -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "maintained",
        indent = { enable = false },
        incremental_selection = { enable = false },
        highlight = {
                enable = true
                -- list of language that will be disabled
                -- disable = { "c", "rust" },
        },
}
return {
        pylsconf = pylsconf,
        treesitterconf = treesitterconf 
}
