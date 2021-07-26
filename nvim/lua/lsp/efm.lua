local on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting({}, 1000)]])
		vim.api.nvim_command([[augroup END]])
	end
end

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true,
}

local python = {
	formatCommand = "black --fast -",
	formatStdin = true,
	lintCommand = "flake8 --max-line-length 160 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintIgnoreExitCode = true,
	lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
	lintSource = "flake8",
}

local luafmt = {
	-- formatCommand = "luafmt -i 2 -l 120 --stdin",
	formatCommand = "stylua -",
	formatStdin = true,
}

local lspinstallPath = vim.fn.stdpath("data") .. "/lspinstall/"
require("lspconfig").efm.setup({
	cmd = { lspinstallPath .. "efm/efm-langserver" },
	on_attach = on_attach,
	init_options = { documentFormatting = true, codeAction = false },
	settings = {
		rootMarkers = { ".git/", "package.json", "main.py" },
		languages = {
			javascript = { eslint },
			javascriptreact = { eslint },
			typescript = { eslint },
			typescriptreact = { eslint },
			python = { python },
			lua = { luafmt },
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"python",
		"lua",
	},
})
