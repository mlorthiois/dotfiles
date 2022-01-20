local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.eslint.with({ command = "eslint_d" }),
		-- null_ls.builtins.formatting.format_r,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.shellcheck,
	},
	on_attach = require("lsp.utils").formatOnSave,
})
