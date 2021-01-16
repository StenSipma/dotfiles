local all_attach = require'completion'.on_attach

-- Prepare snippet capabilities
--require'snippets'.use_suggested_mappings()
-- local nvim_lsp = require('lspconfig')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true;

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

return {
        pylsconf = pylsconf
}
