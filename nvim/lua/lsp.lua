local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

--- Format on Save
local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting({}, 1000)]]
        vim.api.nvim_command [[augroup END]]
    end
end


--- Use lspinstall to install all servers
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{on_attach = on_attach}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

--- LSP saga
local saga = require 'lspsaga'
saga.init_lsp_saga()

--- Comments
require('nvim_comment').setup()

--- EFM lang server for formatting
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

require "lspconfig".efm.setup {
    -- root_dir = nvim_lsp.util.root_pattern(unpack({".git/", "main.py"})),
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    filetypes = {"python", "typescript", "typescriptreact", "javascript", "javascriptreact"},
    settings = {
        rootMarkers = {".git/", "Makefile", "setup.py", "main.py", "package.json"},
        languages = {
            python = {
              {
                formatCommand = "yapf --quiet ",
                formatStdin = true
              }
            },
            typescriptreact = {prettier},
            typescript = {prettier},
            javascript = {prettier},
            javascriptreact = {prettier}
        }
    }
}

