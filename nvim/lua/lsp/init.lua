local lspconfig = require("lspconfig")
-- vim.lsp.set_log_level("debug")

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = "", Warning = "", Hint = "", Information = "" }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--- Filter format on Save and add borders for hover/signature help popup
local disable_format_servers = "tsserver"
local on_attach = function(client)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

	if client.resolved_capabilities.document_formatting and client.name ~= disable_format_servers then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting({}, 1000)]])
		vim.api.nvim_command([[augroup END]])
	else
		client.resolved_capabilities.document_formatting = false
	end
end

--- Root path to LSP server installed by lspinstall
local lspinstallPath = vim.fn.stdpath("data") .. "/lspinstall/"

-- Python
lspconfig.pyright.setup({
	cmd = { lspinstallPath .. "python/node_modules/pyright/langserver.index.js", "--stdio" },
	on_attach = on_attach,
})

-- R
lspconfig.r_language_server.setup({ on_attach = on_attach })

-- Javascript / Typescript
lspconfig.tsserver.setup({
	cmd = { lspinstallPath .. "typescript/node_modules/typescript-language-server/lib/cli.js", "--stdio" },
	on_attach = on_attach,
})

-- C / C++
lspconfig.clangd.setup({
	cmd = { lspinstallPath .. "cpp/clangd/bin/clangd", "--background-index" },
	on_attach = on_attach,
})

-- Go
lspconfig.gopls.setup({
	cmd = { lspinstallPath .. "go/gopls" },
	on_attach = on_attach,
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
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})

local M = {}

M.icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = "了 ",
	EnumMember = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = "ƒ ",
	Module = " ",
	Property = " ",
	Snippet = "﬌ ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

function M.setup()
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end

return M
