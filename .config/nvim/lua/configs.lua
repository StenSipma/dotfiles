local all_attach = require'completion'.on_attach
local util = require('lspconfig/util')

pyls_conf = {
        -- Not sure if this actually does anything...
        settings = {
                configurationSources = "flake8";
                plugins = {
                        pycodestyle = {
                                enabled = false;
                        };
                };
        };
        -- capabilities = capabilities;
        on_attach = all_attach;
}


pyright_conf = {
        --root_dir = root_fallback;
        root_dir = util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt", "*.py");
        settings = {
                python = {
                        analysis = {
                                autoSearchPaths = true;
                                useLibraryCodeForTypes = true
                        };
                };
        };
        on_attach = all_attach;
};

treesitter_conf = {
         -- one of "all", "maintained" (parsers with maintainers), or a list of languages
         -- TODO (2021-01-17): Convert into a list of languages
        ensure_installed = "maintained";
        indent = { enable = false; };
        incremental_selection = { enable = false; };
        highlight = {
                enable = true;
                -- list of language that will be disabled
                -- disable = { "c", "rust" };
        };
};

return {
        pyls_conf = pyls_conf;
        treesitter_conf = treesitter_conf;
        pyright_conf = pyright_conf;
}
