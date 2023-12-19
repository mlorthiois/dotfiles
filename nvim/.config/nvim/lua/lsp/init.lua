local lspconfig = require("lspconfig")
local utils = require("lsp.utils")

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
})
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- Python
lspconfig.pyright.setup({
	on_attach = utils.on_attach,
})

-- R
lspconfig.r_language_server.setup({ on_attach = utils.on_attach })

-- Javascript / Typescript
lspconfig.tsserver.setup({
	on_attach = utils.on_attach,
})

-- Go
lspconfig.gopls.setup({
	on_attach = utils.on_attach,
})

-- TailwindCSS
lspconfig.tailwindcss.setup({})

-- LaTeX
require("lspconfig").texlab.setup({
	on_attach = utils.on_attach,
})

-- CSS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

-- Lua
require("lspconfig").lua_ls.setup({
	on_attach = utils.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})
