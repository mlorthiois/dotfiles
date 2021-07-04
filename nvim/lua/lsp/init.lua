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
local lspinstallPath = vim.fn.stdpath('data') .. "/lspinstall/"
--
lspconfig.pyright.setup{
  cmd = { lspinstallPath .. "python/node_modules/pyright/langserver.index.js", "--stdio" }
}
--
lspconfig.r_language_server.setup{on_attach=on_attach}
--
lspconfig.tsserver.setup{
  cmd = { lspinstallPath .. "typescript/node_modules/typescript-language-server/lib/cli.js", "--stdio"},
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
}
--
lspconfig.clangd.setup{
  cmd = { lspinstallPath .. "cpp/clangd/bin/clangd", "--background-index" },
  on_attach=on_attach
}
--
lspconfig.gopls.setup{
  cmd = { lspinstallPath .. "go/gopls" },
  on_attach=on_attach
}
--
require'lsp.efm'
require'lsp.rust'
