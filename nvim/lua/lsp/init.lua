local lspconfig = require("lspconfig")

local utils = require("lsp.utils")
utils.setup()

--- Root path to LSP server installed by lspinstall
local lspinstallPath = vim.fn.stdpath("data") .. "/lspinstall/"

-- Python
lspconfig.pyright.setup({
	cmd = { lspinstallPath .. "python/node_modules/pyright/langserver.index.js", "--stdio" },
	on_attach = utils.on_attach,
})

-- R
lspconfig.r_language_server.setup({ on_attach = utils.on_attach })

-- Javascript / Typescript
lspconfig.tsserver.setup({
	cmd = { lspinstallPath .. "typescript/node_modules/typescript-language-server/lib/cli.js", "--stdio" },
	on_attach = utils.on_attach,
})

-- C / C++
lspconfig.clangd.setup({
	cmd = { lspinstallPath .. "cpp/clangd/bin/clangd", "--background-index" },
	on_attach = utils.on_attach,
})

-- Go
lspconfig.gopls.setup({
	cmd = { lspinstallPath .. "go/gopls" },
	on_attach = utils.on_attach,
})

-- TailwindCSS
lspconfig.tailwindcss.setup({
	cmd = { lspinstallPath .. "tailwindcss/tailwindcss-intellisense.sh", "--stdio" },
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
