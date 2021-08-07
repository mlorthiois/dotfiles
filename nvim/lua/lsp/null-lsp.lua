local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.black,
	null_ls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
	null_ls.builtins.formatting.format_r,
}

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting({}, 1000)")
		end
	end,
})
