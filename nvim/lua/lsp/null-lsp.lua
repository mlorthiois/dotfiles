local null_ls = require("null-ls")

null_ls.config({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
		null_ls.builtins.formatting.format_r,
		null_ls.builtins.formatting.shfmt,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = require("lsp.utils").formatOnSave,
})
