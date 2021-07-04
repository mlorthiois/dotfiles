local lspconfig = require"lspconfig"

--- Format on Save
local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting({}, 1000)]]
        vim.api.nvim_command [[augroup END]]
    end
end

--- LSP saga
require'lspsaga'.init_lsp_saga()

--- Comments
require('nvim_comment').setup()

--- Languages
lspconfig.pyright.setup{}
lspconfig.r_language_server.setup{on_attach=on_attach}
lspconfig.tsserver.setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
}
-- lspconfig.tailwindcss.setup{}
lspconfig.clangd.setup{on_attach=on_attach}
lspconfig.gopls.setup{on_attach=on_attach}
lspconfig.gopls.setup{on_attach=on_attach}
require'lsp.efm'
require'lsp.rust'
