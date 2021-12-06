local lspconfig = require("lspconfig")

local utils = require("lsp.utils")

--- Root path to LSP server installed by lspinstall
local lspinstallPath = vim.fn.stdpath("data") .. "/lspinstall/"

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

-- C / C++
lspconfig.clangd.setup({
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
	cmd = { lspinstallPath .. "latex/texlab" },
	on_attach = utils.on_attach,
})

-- CSS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
else
	print("Unsupported system for sumneko")
end
local prefix = lspinstallPath .. "lua/sumneko-lua/extension/server/"

require("lspconfig").sumneko_lua.setup({
	cmd = { prefix .. "bin/" .. system_name .. "/lua-language-server", "-E", prefix .. "main.lua" },
	on_attach = utils.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})
