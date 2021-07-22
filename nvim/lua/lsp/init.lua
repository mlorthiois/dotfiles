local lspconfig = require "lspconfig"
vim.lsp.set_log_level("debug")

--- Format on Save
local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting({}, 1000)]]
    vim.api.nvim_command [[augroup END]]
  end
end

--- Root path to LSP server installed by lspinstall
local lspinstallPath = vim.fn.stdpath("data") .. "/lspinstall/"

-- Python
lspconfig.pyright.setup {
  cmd = {lspinstallPath .. "python/node_modules/pyright/langserver.index.js", "--stdio"}
}

-- R
lspconfig.r_language_server.setup {on_attach = on_attach}

-- Javascript / Typescript
lspconfig.tsserver.setup {
  cmd = {lspinstallPath .. "typescript/node_modules/typescript-language-server/lib/cli.js", "--stdio"},
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
}

-- C / C++
lspconfig.clangd.setup {
  cmd = {lspinstallPath .. "cpp/clangd/bin/clangd", "--background-index"},
  on_attach = on_attach
}

-- Go
lspconfig.gopls.setup {
  cmd = {lspinstallPath .. "go/gopls"},
  on_attach = on_attach
}

-- TailwindCSS
lspconfig.tailwindcss.setup {
  cmd = {lspinstallPath .. "tailwindcss/tailwindcss-intellisense.sh", "--stdio"}
}

-- External files
require "lsp.efm"
