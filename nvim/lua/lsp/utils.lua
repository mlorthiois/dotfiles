local M = {}

--- Filter format on Save and add borders for hover/signature help popup
local disable_format_servers = "tsserver"
M.on_attach = function(client)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

	if client.resolved_capabilities.document_formatting and client.name ~= disable_format_servers then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
		vim.api.nvim_command([[augroup END]])
	else
		client.resolved_capabilities.document_formatting = false
	end
end

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

function M.setup()
	local icons = {
		Class = " Class",
		Color = " Color",
		Constant = " Constant",
		Constructor = " Constructor",
		Enum = "了Enum",
		EnumMember = " Enum Member",
		Field = " Field",
		File = " File",
		Folder = " Folder",
		Function = " Function",
		Interface = "ﰮ Interface",
		Keyword = " Keyword",
		Method = "ƒ Method",
		Module = " Module",
		Property = " Property",
		Snippet = "﬌ Snippet",
		Struct = " Struct",
		Text = " Text",
		Unit = " Unit",
		Value = " Value",
		Variable = " Variable",
	}
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = icons[kind] or kind
	end
end

return M
