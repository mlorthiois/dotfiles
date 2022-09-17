local M = {}

--- Filter format on Save
local disable_format_servers = { "tsserver", "sumneko_lua" }
M.formatOnSave = function(client)
	for _, value in ipairs(disable_format_servers) do
		if client.resolved_capabilities.document_formatting and client.name == value then
			client.resolved_capabilities.document_formatting = false
			return
		end
	end

	vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
end

M.on_attach = function(client)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
	M.formatOnSave(client)
end

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return M
